(set-logic QF_BV)
(set-option :produce-models true)
(declare-const bv_0 (_ BitVec 256))
(declare-const bv_1 (_ BitVec 256))
(declare-const bv_2 (_ BitVec 256))
(declare-const bv_3 (_ BitVec 256))
(declare-const bv_4 (_ BitVec 256))
(declare-const bv_5 (_ BitVec 256))
(declare-const bv_6 (_ BitVec 256))
(declare-const bv_7 (_ BitVec 256))
(declare-const bv_8 (_ BitVec 256))
(declare-const bv_9 (_ BitVec 256))
(assert (= bv_2 (bvor bv_1 bv_0)))
(assert (= bv_3 (bvnot bv_0)))
(assert (= bv_4 (bvand bv_1 bv_0)))
(assert (= bv_5 (bvxor bv_0 bv_3)))
(assert (= bv_6 (bvor bv_3 bv_5)))
(assert (= bv_7 (bvadd bv_1 bv_3)))
(assert (= bv_8 (bvand bv_2 bv_7)))
(assert (= bv_9 (bvadd bv_7 bv_6)))
(declare-const z_0 Bool)
(declare-const z_1 Bool)
(declare-const z_2 Bool)
(declare-const z_3 Bool)
(assert (= z_0 (= bv_8 bv_4)))
(assert (= z_1 (= bv_5 bv_3)))
(assert (= z_2 (= bv_6 bv_2)))
(assert (= z_3 (= bv_7 bv_9)))
(assert ( and ( or z_3 ( and z_1 z_2 ) ) z_0 ) )
(check-sat)
(get-model)
(exit)
