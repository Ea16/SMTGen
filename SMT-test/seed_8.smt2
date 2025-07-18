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
(declare-const bv_10 (_ BitVec 256))
(declare-const bv_11 (_ BitVec 256))
(declare-const bv_12 (_ BitVec 256))
(declare-const bv_13 (_ BitVec 256))
(declare-const bv_14 (_ BitVec 256))
(assert (= bv_2 (bvurem bv_1 bv_0)))
(assert (= bv_3 (bvlshr bv_2 bv_0)))
(assert (= bv_4 (bvlshr bv_3 bv_2)))
(assert (= bv_5 (bvlshr bv_2 bv_1)))
(assert (= bv_6 (bvnot bv_4)))
(assert (= bv_7 (bvshl bv_0 bv_3)))
(assert (= bv_8 (bvadd bv_5 bv_3)))
(assert (= bv_9 (bvxor bv_1 bv_6)))
(assert (= bv_10 (bvadd bv_0 bv_6)))
(assert (= bv_11 (bvudiv bv_3 bv_1)))
(assert (= bv_12 (bvnot bv_7)))
(assert (= bv_13 (bvsub bv_4 bv_12)))
(assert (= bv_14 (bvshl bv_4 bv_5)))
(declare-const z_0 Bool)
(declare-const z_1 Bool)
(declare-const z_2 Bool)
(declare-const z_3 Bool)
(declare-const z_4 Bool)
(declare-const z_5 Bool)
(assert (= z_0 (= bv_14 bv_2)))
(assert (= z_1 (= bv_4 bv_9)))
(assert (= z_2 (= bv_7 bv_12)))
(assert (= z_3 (= bv_5 bv_10)))
(assert (= z_4 (= bv_6 bv_8)))
(assert (= z_5 (= bv_13 bv_3)))
(assert ( or ( or ( and z_0 z_1 ) ( and z_5 ( not ( or z_4 z_2 ) ) ) ) z_3 ) )
(check-sat)
(get-model)
(exit)
