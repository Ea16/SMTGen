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
(declare-const bv_9 Bool)
(declare-const bv_10 (_ BitVec 256))
(declare-const bv_11 (_ BitVec 256))
(declare-const bv_12 (_ BitVec 256))
(declare-const bv_13 (_ BitVec 256))
(declare-const bv_14 (_ BitVec 256))
(declare-const bv_15 (_ BitVec 256))
(declare-const bv_16 (_ BitVec 256))
(assert (= bv_1 (bvneg bv_0)))
(assert (= bv_2 (bvand bv_1 bv_0)))
(assert (= bv_3 (bvlshr bv_2 bv_1)))
(assert (= bv_4 (bvand bv_3 bv_1)))
(assert (= bv_5 (bvlshr bv_3 bv_1)))
(assert (= bv_6 (bvshl bv_1 bv_5)))
(assert (= bv_7 (bvlshr bv_1 bv_2)))
(assert (= bv_8 (bvsub bv_0 bv_7)))
(assert (= bv_9 (bvsge bv_0 bv_6)))
(assert (= bv_10 (bvand bv_7 bv_5)))
(assert (= bv_11 (bvand bv_6 bv_8)))
(assert (= bv_12 (bvneg bv_10)))
(assert (= bv_13 (bvneg bv_6)))
(assert (= bv_14 (bvand bv_12 bv_6)))
(assert (= bv_15 (bvmul bv_2 bv_14)))
(assert (= bv_16 (bvshl bv_1 bv_13)))
(declare-const z_0 Bool)
(declare-const z_1 Bool)
(declare-const z_2 Bool)
(declare-const z_3 Bool)
(declare-const z_4 Bool)
(declare-const z_5 Bool)
(declare-const z_6 Bool)
(assert (= z_0 (= bv_13 bv_6)))
(assert (= z_1 (= bv_11 bv_16)))
(assert (= z_2 (= bv_7 bv_2)))
(assert (= z_3 (= bv_5 bv_10)))
(assert (= z_4 (= bv_8 bv_12)))
(assert (= z_5 (= bv_1 bv_4)))
(assert (= z_6 (= bv_3 bv_15)))
(assert ( or ( and z_6 ( or ( or z_5 ( or z_2 z_4 ) ) ( or z_3 z_0 ) ) ) z_1 ) )
(check-sat)
(get-model)
(exit)
