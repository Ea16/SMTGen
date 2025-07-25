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
(declare-const bv_15 (_ BitVec 256))
(declare-const bv_16 Bool)
(declare-const bv_17 (_ BitVec 256))
(declare-const bv_18 (_ BitVec 256))
(declare-const bv_19 (_ BitVec 256))
(declare-const bv_20 (_ BitVec 256))
(declare-const bv_21 (_ BitVec 256))
(declare-const bv_22 (_ BitVec 256))
(declare-const bv_23 (_ BitVec 256))
(declare-const bv_24 (_ BitVec 256))
(declare-const bv_25 (_ BitVec 256))
(declare-const bv_26 (_ BitVec 256))
(declare-const bv_27 (_ BitVec 256))
(declare-const bv_28 (_ BitVec 256))
(assert (= bv_2 (bvsub bv_1 bv_0)))
(assert (= bv_3 (bvxor bv_2 bv_0)))
(assert (= bv_4 (bvurem bv_0 bv_3)))
(assert (= bv_5 (bvadd bv_0 bv_3)))
(assert (= bv_6 (bvlshr bv_1 bv_2)))
(assert (= bv_7 (bvor bv_4 bv_1)))
(assert (= bv_8 (bvurem bv_0 bv_5)))
(assert (= bv_9 (bvlshr bv_5 bv_2)))
(assert (= bv_10 (bvlshr bv_6 bv_3)))
(assert (= bv_11 (bvlshr bv_2 bv_0)))
(assert (= bv_12 (bvsub bv_11 bv_0)))
(assert (= bv_13 (bvxor bv_10 bv_8)))
(assert (= bv_14 (bvsub bv_4 bv_5)))
(assert (= bv_15 (bvlshr bv_10 bv_8)))
(assert (= bv_16 (bvsle bv_0 bv_13)))
(assert (= bv_17 (bvlshr bv_4 bv_5)))
(assert (= bv_18 (bvlshr bv_4 bv_6)))
(assert (= bv_19 (bvsub bv_18 bv_13)))
(assert (= bv_20 (bvadd bv_17 bv_7)))
(assert (= bv_21 (bvlshr bv_1 bv_15)))
(assert (= bv_22 (bvor bv_19 bv_5)))
(assert (= bv_23 (bvsub bv_5 bv_19)))
(assert (= bv_24 (bvshl bv_2 bv_22)))
(assert (= bv_25 (bvneg bv_14)))
(assert (= bv_26 (bvsub bv_4 bv_1)))
(assert (= bv_27 (bvsub bv_2 bv_14)))
(assert (= bv_28 (bvadd bv_8 bv_25)))
(declare-const z_0 Bool)
(declare-const z_1 Bool)
(declare-const z_2 Bool)
(declare-const z_3 Bool)
(declare-const z_4 Bool)
(declare-const z_5 Bool)
(declare-const z_6 Bool)
(declare-const z_7 Bool)
(declare-const z_8 Bool)
(declare-const z_9 Bool)
(assert (= z_0 (= bv_22 bv_2)))
(assert (= z_1 (= bv_8 bv_21)))
(assert (= z_2 (= bv_14 bv_26)))
(assert (= z_3 (= bv_3 bv_5)))
(assert (= z_4 (= bv_28 bv_27)))
(assert (= z_5 (= bv_9 bv_23)))
(assert (= z_6 (= bv_17 bv_25)))
(assert (= z_7 (= bv_12 bv_11)))
(assert (= z_8 (= bv_6 bv_18)))
(assert (= z_9 (= bv_19 bv_4)))
(assert ( or ( or ( or ( and z_2 z_9 ) z_5 ) ( or ( and z_0 ( or z_3 z_6 ) ) ( or z_7 z_8 ) ) ) ( or z_1 z_4 ) ) )
(check-sat)
(get-model)
(exit)
