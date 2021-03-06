component extends = "lib.util.tests.ContainerTestCase" {

	function setup() {
		variables.container = new lib.util.CookieContainer(name = "MxUnit");

		variables.container.destroy();
	}

	function test_scope() {
		local.value = getTickCount();
		variables.container.put("MxUnit_test_scope", local.value);

		assertTrue(find("""MxUnit_test_scope"":#local.value#", cookie["MxUnit"]));
	}

}