component extends = "mxunit.framework.TestCase" {

	function test_clear() {
		variables.container.put("MxUnitTest_clear", "MxUnitTest_clear_value");
		assertTrue(variables.container.containsKey("MxUnitTest_clear"));
		variables.container.clear();
		assertTrue(variables.container.isEmpty());
	}

	function test_containsKey() {
		variables.container.put("MxUnitTest_containsKey", "MxUnitTest_containsKey_value");
		assertTrue(variables.container.containsKey("MxUnitTest_containsKey"));
	}

	function test_delete() {
		variables.container.put("MxUnitTest_delete", "MxUnitTest_delete_value");
		assertTrue(variables.container.containsKey("MxUnitTest_delete"));
		variables.container.delete("MxUnitTest_delete");
		assertFalse(variables.container.containsKey("MxUnitTest_delete"));
	}

	function test_destroy() {
		variables.container.put("MxUnitTest_destroy", "MxUnitTest_destroy_value");
		variables.container.destroy();
		assertTrue(variables.container.isEmpty());
	}

	function test_get() {
		local.value = "MxUnitTest_get_value";
		variables.container.put("MxUnitTest_get", local.value);
		assertEquals(local.value, variables.container.get("MxUnitTest_get"));
	}

	function test_keyList() {
		variables.container.put("MxUnitTest_key1", "MxUnitTest_key1_value");
		variables.container.put("MxUnitTest_key2", "MxUnitTest_key2_value");
		assertEquals("MxUnitTest_key1,MxUnitTest_key2", variables.container.keyList());
	}

	function test_putAll() {
		local.struct = {};
		local.struct["MxUnitTest_putAll_1"] = "MxUnitTest_putAll_1_value";
		local.struct["MxUnitTest_putAll_2"] = "MxUnitTest_putAll_2_value";
		local.struct["MxUnitTest_putAll_3"] = "MxUnitTest_putAll_3_value";

		variables.container.putAll(values = local.struct);

		assertTrue(variables.container.containsKey("MxUnitTest_putAll_1"));
		assertTrue(variables.container.containsKey("MxUnitTest_putAll_2"));
		assertTrue(variables.container.containsKey("MxUnitTest_putAll_3"));
	}

	function test_putAll_clear() {
		local.struct = {};
		local.struct["MxUnitTest_putAll_1"] = "MxUnitTest_putAll_1_value";
		local.struct["MxUnitTest_putAll_2"] = "MxUnitTest_putAll_2_value";
		local.struct["MxUnitTest_putAll_3"] = "MxUnitTest_putAll_3_value";

		variables.container.putAll(values = local.struct);

		// assert clear
		variables.container.putAll(
			values = {
				MxUnitTest_putAll_clear: "MxUnitTest_putAll_clear"
			},
			clear = true
		);

		assertEquals("MxUnitTest_putAll_clear", variables.container.keyList());
	}

	function test_putAll_overwrite() {
		local.struct = {};
		local.struct["MxUnitTest_putAll_1"] = "MxUnitTest_putAll_1_value";

		variables.container.putAll(values = local.struct);

		// assert overwrite false
		local.struct["MxUnitTest_putAll_1"] = "MxUnitTest_putAll_1_value_EDIT";

		variables.container.putAll(values = local.struct);

		assertNotEquals("MxUnitTest_putAll_1_value_EDIT", variables.container.get("MxUnitTest_putAll_1"));

		// assert overwrite true
		variables.container.putAll(values = local.struct, overwrite = true);

		assertEquals("MxUnitTest_putAll_1_value_EDIT", variables.container.get("MxUnitTest_putAll_1"));
	}

	function test_values() {
		variables.container.put("MxUnitTest_values", "MxUnitTest_values_value");
		local.collection = variables.container.values();
		assertEquals(local.collection.MxUnitTest_values, variables.container.get("MxUnitTest_values"));
		local.collection.MxUnitTest_values = "modified value";
		assertNotEquals(local.collection.MxUnitTest_values, variables.container.get("MxUnitTest_values"));
	}

}