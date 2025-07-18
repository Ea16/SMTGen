(set-logic QF_BV)
(set-option :produce-models true)
(declare-const bv_0 (_ BitVec 256))
(declare-const bv_1 (_ BitVec 256))
(declare-const bv_2 Bool)
(declare-const bv_3 (_ BitVec 256))
(declare-const bv_4 (_ BitVec 256))
(declare-const bv_5 (_ BitVec 256))
(declare-const bv_6 (_ BitVec 256))
(declare-const bv_7 (_ BitVec 256))
(declare-const bv_8 (_ BitVec 256))
(declare-const bv_9 (_ BitVec 256))
(declare-const bv_10 (_ BitVec 256))
(assert (= bv_2 (bvult bv_1 bv_0)))
(assert (= bv_3 (bvlshr bv_0 bv_1)))
(assert (= bv_4 (bvshl bv_0 bv_1)))
(assert (= bv_5 (bvnot bv_1)))
(assert (= bv_6 (bvneg bv_1)))
(assert (= bv_7 (bvadd bv_0 bv_4)))
(assert (= bv_8 (bvand bv_4 bv_1)))
(assert (= bv_9 (bvadd bv_4 bv_7)))
(assert (= bv_10 (bvor bv_3 bv_7)))
(declare-const z_0 Bool)
(declare-const z_1 Bool)
(declare-const z_2 Bool)
(declare-const z_3 Bool)
(assert (= z_0 (= bv_8 bv_9)))
(assert (= z_1 (= bv_4 bv_7)))
(assert (= z_2 (= bv_6 bv_10)))
(assert (= z_3 (= bv_5 bv_3)))
(assert ( and ( or z_1 z_2 ) ( or z_3 z_0 ) ) )
(check-sat)
(get-model)
(exit)
