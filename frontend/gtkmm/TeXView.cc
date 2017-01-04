
 #include "TeXView.hh"
 #include <iostream>

 using namespace cadabra;

 TeXView::TeXView(TeXEngine& eng, DTree::iterator it, int hmargin)
	 : content(0), datacell(it), vbox(false, 10), hbox(false, hmargin), engine(eng)
	 {
	 content = engine.checkin(datacell->textbuf, "", "");

#if GTK_CHECK_VERSION(3,10,0)	 
	 add(rbox);
	 rbox.add(vbox);
	 rbox.set_reveal_child(false);
	 rbox.set_transition_duration(1000);
	 rbox.set_transition_type(Gtk::REVEALER_TRANSITION_TYPE_CROSSFADE); //SLIDE_DOWN);
#else
	 add(vbox)
#endif		 
	 vbox.set_margin_top(10);
	 vbox.set_margin_bottom(0);
	 vbox.pack_start(hbox, Gtk::PACK_SHRINK, 0);
	 hbox.pack_start(image, Gtk::PACK_SHRINK, hmargin);
//	 add(image);
	 override_background_color(Gdk::RGBA("white"));
	 }

 TeXView::~TeXView()
	 {
	 engine.checkout(content);
	 }

void TeXView::on_show() 
	{
	convert();
	Gtk::EventBox::on_show();
	}

//bool TeXView::on_configure_event(GdkEventConfigure *ev)
//	 {
//	 bool ret = Gtk::EventBox::on_configure_event(ev);
//	 convert();
//
//	 return ret;
//	 }

void TeXView::convert()
	{
	try {
		// Ensure that all TeX cells have been rendered by TeX. This will do nothing
		// if no TeX cells need (re-)rendering. When adding many cells in one go, do so
		// in hidden state. Then, at first show, the first cell will trigger the 
		// convert_all and run TeX on all cells in one shot.
		
		engine.convert_all();
		
		// Set the Pixbuf to the image generated by engine.
		
		if(content->image().data()!=0) {
			//std::cerr << "SHOULD NOT HAPPEN" << std::endl;
			Glib::RefPtr<Gdk::Pixbuf> pixbuf = 
				Gdk::Pixbuf::create_from_data(content->image().data(), Gdk::COLORSPACE_RGB, 
														true,
														8, 
														content->width(), content->height(),
														4*content->width());
			
			image.set(pixbuf);
			}
		}
	catch(TeXEngine::TeXException& ex) {
		tex_error.emit(ex.what());
		}
	}


void TeXView::dim(bool d)
	 {
	 if(d) image.set_opacity(0.3);
	 else  image.set_opacity(1.0);
	 }

 bool TeXView::on_button_release_event(GdkEventButton *ev)
	 {
	 show_hide_requested.emit(datacell);
	 return true;
	 }

 void TeXView::update_image()
	 {
	Glib::RefPtr<Gdk::Pixbuf> pixbuf = 
		Gdk::Pixbuf::create_from_data(content->image().data(), Gdk::COLORSPACE_RGB, 
												true,
												8, 
												content->width(), content->height(),
												4*content->width());

	image.set(pixbuf);
	}


