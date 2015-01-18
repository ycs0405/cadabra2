
#pragma once

#include "properties/TableauBase.hh"

class KroneckerDelta : public TableauBase, virtual public property {
	public:
		virtual ~KroneckerDelta() {};
		virtual std::string name() const;

		virtual unsigned int size(const Properties&, exptree&, exptree::iterator) const;
		virtual tab_t        get_tab(const Properties &, exptree&, exptree::iterator, unsigned int) const;
};

