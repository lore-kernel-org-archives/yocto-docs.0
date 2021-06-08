Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10232.1623146347321989024
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 02:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1ED2E1BF210;
	Tue,  8 Jun 2021 09:59:04 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] test-manual: add initial reproducible builds documentation
Date: Tue,  8 Jun 2021 11:58:53 +0200
Message-Id: <20210608095853.48522-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16868CB8BF8EEF84.10003@lists.yoctoproject.org>
References: <16868CB8BF8EEF84.10003@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/index.rst           |  1 +
 .../test-manual/reproducible-builds.rst       | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 documentation/test-manual/reproducible-builds.rst

diff --git a/documentation/test-manual/index.rst b/documentation/test-manual/index.rst
index e2198c4c39..d122b5e270 100644
--- a/documentation/test-manual/index.rst
+++ b/documentation/test-manual/index.rst
@@ -13,6 +13,7 @@ Yocto Project Test Environment Manual
    intro
    test-process
    understand-autobuilder
+   reproducible-builds
    history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
new file mode 100644
index 0000000000..c2e13d410f
--- /dev/null
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -0,0 +1,55 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+*******************
+Reproducible Builds
+*******************
+
+================
+How we define it
+================
+
+The Yocto Project defines reproducibility as where a given input build configuration will give the same binary output regardless of when it is built (now or in 5 years time), regardless of the path on the filesystem the build is run in, and regardless of the distro and tools on the underlying host system the build is running on.
+
+==============
+Why it matters
+==============
+
+The project aligns with the `Reproducible Builds project <https://reproducible-builds.org/>`_, which shares information about why reproducibility matters. The primary focus of the project is the ability to detect security issues being introduced. However, from a Yocto Project perspective, it is also hugely important that our builds are deterministic. When you build a given input set of metadata, we expect you to get consistent output. This has always been a key focus but is now true down to the binary level including timestamps.
+
+For example, at some point in the future life of a product, you find that you need to rebuild to add a security fix. If this happens, only the components that have been modified should change at the binary level. This would lead to much easier and clearer bounds on where validation is needed.
+
+This also gives an additional benefit to the project builds themselves, our hash equivalence for :ref:`Shared State <overview-manual/concepts:Shared State>` object reuse works much more effectively when the binary output remains the same.
+
+===================
+How we implement it
+===================
+
+There are many different aspects to build reproducibility, but some particular things we do within the build system to ensure reproducibility include:
+
+* Adding mappings to the compiler options to ensure debug filepaths are mapped to consistent target compatible paths. This is done through the ``DEBUG_PREFIX_MAP`` variable which sets the ``-fmacro-prefix-map`` and ``-fdebug-prefix-map`` compiler options correctly to map to target paths.
+* Being explicit about recipe dependencies and their configuration (no floating configure options or host dependencies creeping in). In particular this means making sure :term:`PACKAGECONFIG` coverage covers configure options which may otherwise try and auto-detect host dependencies.
+* Using recipe specific sysroots to isolate recipes so they only see their dependencies. These are visible as ``recipe-sysroot`` and ``recipe-sysroot-native`` directories within the :term:`WORKDIR` of a given recipe and are populated only with the dependencies a recipe has.
+* Build images from a reduced package set: only packages from recipes the image depends upon.
+* Filtering the tools available from the host's PATH to only a specific set of tools, set using the :term:`HOSTTOOLS` variable.
+
+=========================================
+Can we prove the project is reproducible?
+=========================================
+
+Yes, we can prove it and we now regularly test this on the Autobuilder. At the time of writing (Hardknott 3.3), OE-Core is 100% reproducible for all its recipes (i.e. world builds) apart from the Go language and Ruby documentation packages. Unfortunately, the current implementation of the Go language has fundamental reproducibility problems as it always depends upon the paths it is build in.
+
+To run our automated selftest, as we use in our CI on the Autobuilder, you can run::
+
+   oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds
+
+This defaults to including a world build so, if other layers are added, it would also run the tests for recipes in the additional layers. The first build will be run using Shared State if available, the second build explicitly disables Shared State and builds on the specific host the build is running on. This means we can test reproducibility builds between different host distributions over time on the Autobuilder.
+
+If ``OEQA_DEBUGGING_SAVED_OUTPUT`` is set, any differing packages will be saved here. The test is also able to run the ``diffoscope`` command on the output to generate HTML files showing the differences between the packages, to aid debugging. On the Autobuilder, these appear under https://autobuilder.yocto.io/pub/repro-fail/ in the form ``oe-reproducible + <date> + <random ID>``, e.g. ``oe-reproducible-20200202-1lm8o1th``.
+
+The project's current reproducibility status can be seen at https://www.yoctoproject.org/reproducible-build-results/
+
+===============================
+Can I test my layer or recipes?
+===============================
+
+Yes, see the self test in :ref:`oe-selftest <ref-manual/release-process:Testing and Quality Assurance>` at `meta/lib/oeqa/selftest/cases/reproducible.py <https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`_ which can be subclassed for specific use cases.
-- 
2.25.1

