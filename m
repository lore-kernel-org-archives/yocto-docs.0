Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.2958.1589626342751392915
 for <docs@lists.yoctoproject.org>;
 Sat, 16 May 2020 03:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:33424 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jZuQU-00GQN9-EF; Sat, 16 May 2020 06:52:20 -0400
Date: Sat, 16 May 2020 06:52:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
cc: Mark Morton <mark.morton@windriver.com>
Subject: [PATCH][RFC] ref-manual: add content for new features_check.bbclass
Message-ID: <alpine.LFD.2.21.2005160649220.9970@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  first pass at adding everything related to features_check.bbclass;
lots of changes so good chance i missed something. if no objections,
will submit for real.

  related bugzilla entry:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13884

rday

---


diff --git a/documentation/ref-manual/migration.xml b/documentation/ref-manual/migration.xml
index affc8b90a..66133f6ef 100644
--- a/documentation/ref-manual/migration.xml
+++ b/documentation/ref-manual/migration.xml
@@ -7188,7 +7188,26 @@ id=f4d4f99cfbc2396e49c1613a7d237b9e57f06f81'>commit message</ulink>.
         <title>features_check class replaces distro_features_check</title>

         <para>
-            The <filename>distro_features_check</filename> class has had its functionality expanded, now supporting <filename>ANY_OF_MACHINE_FEATURES</filename>, <filename>REQUIRED_MACHINE_FEATURES</filename>, <filename>CONFLICT_MACHINE_FEATURES</filename>, <filename>ANY_OF_COMBINED_FEATURES</filename>, <filename>REQUIRED_COMBINED_FEATURES</filename>, <filename>CONFLICT_COMBINED_FEATURES</filename>. As a result the class has now been renamed to <filename>features_check</filename>; the <filename>distro_features_check</filename> class still exists but generates a warning and redirects to the new class. In preparation for a future removal of the old class it is recommended that you update recipes currently inheriting <filename>distro_features_check</filename> to inherit <filename>features_check</filename> instead.
+            The <filename>distro_features_check</filename> class has had its functionality expanded,
+            now supporting the checks:
+            <itemizedlist>
+                <listitem><para><link linkend='var-REQUIRED_MACHINE_FEATURES'><filename>REQUIRED_MACHINE_FEATURES</filename></link></para></listitem>
+                <listitem><para><link linkend='var-ANY_OF_MACHINE_FEATURES'><filename>ANY_OF_MACHINE_FEATURES</filename></link></para></listitem>
+                <listitem><para><link linkend='var-CONFLICT_MACHINE_FEATURES'><filename>CONFLICT_MACHINE_FEATURES</filename></link></para></listitem>
+                <listitem><para><link linkend='var-REQUIRED_DISTRO_FEATURES'><filename>REQUIRED_DISTRO_FEATURES</filename></link></para></listitem>
+                <listitem><para><link linkend='var-ANY_OF_DISTRO_FEATURES'><filename>ANY_OF_DISTRO_FEATURES</filename></link></para></listitem>
+                <listitem><para><link linkend='var-CONFLICT_DISTRO_FEATURES'><filename>CONFLICT_DISTRO_FEATURES</filename></link></para></listitem>
+                <listitem><para><link linkend='var-REQUIRED_COMBINED_FEATURES'><filename>REQUIRED_COMBINED_FEATURES</filename></link></para></listitem>
+                <listitem><para><link linkend='var-ANY_OF_COMBINED_FEATURES'><filename>ANY_OF_COMBINED_FEATURES</filename></link></para></listitem>
+                <listitem><para><link linkend='var-CONFLICT_COMBINED_FEATURES'><filename>CONFLICT_COMBINED_FEATURES</filename></link></para></listitem>
+            </itemizedlist>
+            As a result, the class has been renamed to
+            <link linkend='ref-classes-features_check'><filename>features_check</filename></link>;
+            the <link linkend='ref-classes-distro_features_check'><filename>distro_features_check</filename></link>
+            class still exists but generates a deprecation warning and redirects to the new class.
+            In preparation for a future removal of the old class, it is recommended that you
+            update recipes currently inheriting <filename>distro_features_check</filename>
+            to inherit <filename>features_check</filename> instead.
         </para>
     </section>

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index f9bbddd72..d3dd5f348 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -677,19 +677,8 @@
     <title><filename>distro_features_check.bbclass</filename></title>

     <para>
-        The <filename>distro_features_check</filename> class
-        allows individual recipes to check for required and conflicting
-        <link linkend='var-DISTRO_FEATURES'><filename>DISTRO_FEATURES</filename></link>.
-    </para>
-
-    <para>
-        This class provides support for the
-        <link linkend='var-REQUIRED_DISTRO_FEATURES'><filename>REQUIRED_DISTRO_FEATURES</filename></link>
-        and
-        <link linkend='var-CONFLICT_DISTRO_FEATURES'><filename>CONFLICT_DISTRO_FEATURES</filename></link>
-        variables.
-        If any conditions specified in the recipe using the above variables are
-        not met, the recipe will be skipped.
+        This class has been deprecated in favour of the newer
+        <link linkend='ref-classes-features_check'><filename>features_check</filename></link> class.
     </para>
 </section>

@@ -865,6 +854,34 @@
     </para>
 </section>

+<section id='ref-classes-features_check'>
+    <title><filename>features_check.bbclass</filename></title>
+
+    <para>
+        The <filename>features_check</filename> class
+        allows individual recipes to check for required and conflicting
+        <link linkend='var-DISTRO_FEATURES'><filename>DISTRO_FEATURES</filename></link> and
+        <link linkend='var-MACHINE_FEATURES'><filename>MACHINE_FEATURES</filename></link>,
+        and replaces the now-deprecated
+        <link linkend='ref-classes-distro_features_check'><filename>distro_features_check</filename></link> class.
+    </para>
+
+    <para>
+        This class now supports the definition of the feature tests:
+        <itemizedlist>
+            <listitem><para><link linkend='var-REQUIRED_MACHINE_FEATURES'><filename>REQUIRED_MACHINE_FEATURES</filename></link></para></listitem>
+            <listitem><para><link linkend='var-ANY_OF_MACHINE_FEATURES'><filename>ANY_OF_MACHINE_FEATURES</filename></link></para></listitem>
+            <listitem><para><link linkend='var-CONFLICT_MACHINE_FEATURES'><filename>CONFLICT_MACHINE_FEATURES</filename></link></para></listitem>
+            <listitem><para><link linkend='var-REQUIRED_DISTRO_FEATURES'><filename>REQUIRED_DISTRO_FEATURES</filename></link></para></listitem>
+            <listitem><para><link linkend='var-ANY_OF_DISTRO_FEATURES'><filename>ANY_OF_DISTRO_FEATURES</filename></link></para></listitem>
+            <listitem><para><link linkend='var-CONFLICT_DISTRO_FEATURES'><filename>CONFLICT_DISTRO_FEATURES</filename></link></para></listitem>
+            <listitem><para><link linkend='var-REQUIRED_COMBINED_FEATURES'><filename>REQUIRED_COMBINED_FEATURES</filename></link></para></listitem>
+            <listitem><para><link linkend='var-ANY_OF_COMBINED_FEATURES'><filename>ANY_OF_COMBINED_FEATURES</filename></link></para></listitem>
+            <listitem><para><link linkend='var-CONFLICT_COMBINED_FEATURES'><filename>CONFLICT_COMBINED_FEATURES</filename></link></para></listitem>
+        </itemizedlist>
+    </para>
+</section>
+
 <section id='ref-classes-fontcache'>
     <title><filename>fontcache.bbclass</filename></title>

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 364cd09eb..3ef302df4 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -246,6 +246,60 @@
             </glossdef>
         </glossentry>

+        <glossentry id='var-ANY_OF_COMBINED_FEATURES'><glossterm>ANY_OF_COMBINED_FEATURES</glossterm>
+            <info>
+                ANY_OF_COMBINED_FEATURES[doc] = "When a recipe inherits the features_check class, this variable identifies combined features of which at least one must be selected."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    When inheriting the
+                    <link linkend='ref-classes-features_check'><filename>features_check</filename></link>
+                    class, this variable identifies combined features of which
+                    at least one must be selected.
+                    In other words, if none of the features listed in the
+                    <filename>ANY_OF_COMBINED_FEATURES</filename> variable appears in
+                    <link linkend='var-COMBINED_FEATURES'><filename>COMBINED_FEATURES</filename></link>
+                    within the current configuration, an error occurs and the build stops.
+                </para>
+            </glossdef>
+        </glossentry>
+
+        <glossentry id='var-ANY_OF_DISTRO_FEATURES'><glossterm>ANY_OF_DISTRO_FEATURES</glossterm>
+            <info>
+                ANY_OF_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class, this variable identifies distro features of which at least one must be selected."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    When inheriting the
+                    <link linkend='ref-classes-features_check'><filename>features_check</filename></link>
+                    class, this variable identifies distribution features of which
+                    at least one must be selected.
+                    In other words, if none of the features listed in the
+                    <filename>ANY_OF_DISTRO_FEATURES</filename> variable appears in
+                    <link linkend='var-DISTRO_FEATURES'><filename>DISTRO_FEATURES</filename></link>
+                    within the current configuration, an error occurs and the build stops.
+                </para>
+            </glossdef>
+        </glossentry>
+
+        <glossentry id='var-ANY_OF_MACHINE_FEATURES'><glossterm>ANY_OF_MACHINE_FEATURES</glossterm>
+            <info>
+                ANY_OF_MACHINE_FEATURES[doc] = "When a recipe inherits the features_check class, this variable identifies machine features of which at least one must be selected."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    When inheriting the
+                    <link linkend='ref-classes-features_check'><filename>features_check</filename></link>
+                    class, this variable identifies machine features of which
+                    at least one must be selected.
+                    In other words, if none of the features listed in the
+                    <filename>ANY_OF_MACHINE_FEATURES</filename> variable appears in
+                    <link linkend='var-MACHINE_FEATURES'><filename>MACHINE_FEATURES</filename></link>
+                    within the current configuration, an error occurs and the build stops.
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-APPEND'><glossterm>APPEND</glossterm>
             <info>
                 APPEND[doc] = "An override list of append strings for target specified using LABELS."
@@ -2536,20 +2590,36 @@
             </glossdef>
         </glossentry>

+        <glossentry id='var-CONFLICT_COMBINED_FEATURES'><glossterm>CONFLICT_COMBINED_FEATURES</glossterm>
+            <info>
+                CONFLICT_COMBINED_FEATURES[doc] = "When a recipe inherits the features_check class, this variable identifies combined features that would be in conflict should the recipe be built."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    When inheriting the
+                    <link linkend='ref-classes-features_check'><filename>features_check</filename></link>
+                    class, this variable identifies combined features that would
+                    be in conflict should the recipe be built.
+                    In other words, if the <filename>CONFLICT_COMBINED_FEATURES</filename> variable
+                    lists a feature that also appears in
+                    <filename>COMBINED_FEATURES</filename> within the
+                    current configuration, an error occurs and the
+                    build stops.
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-CONFLICT_DISTRO_FEATURES'><glossterm>CONFLICT_DISTRO_FEATURES</glossterm>
             <info>
-                CONFLICT_DISTRO_FEATURES[doc] = "When a recipe inherits the distro_features_check class, this variable identifies distribution features that would be in conflict should the recipe be built."
+                CONFLICT_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class, this variable identifies distribution features that would be in conflict should the recipe be built."
             </info>
             <glossdef>
                 <para role="glossdeffirst">
                     When inheriting the
-                    <link linkend='ref-classes-distro_features_check'><filename>distro_features_check</filename></link>
-                    class, this
-                    variable identifies distribution features that would
-                    be in conflict should the recipe
-                    be built.
-                    In other words, if the
-                    <filename>CONFLICT_DISTRO_FEATURES</filename> variable
+                    <link linkend='ref-classes-features_check'><filename>features_check</filename></link>
+                    class, this variable identifies distribution features that would
+                    be in conflict should the recipe be built.
+                    In other words, if the <filename>CONFLICT_DISTRO_FEATURES</filename> variable
                     lists a feature that also appears in
                     <filename>DISTRO_FEATURES</filename> within the
                     current configuration, an error occurs and the
@@ -2558,6 +2628,25 @@
             </glossdef>
         </glossentry>

+        <glossentry id='var-CONFLICT_MACHINE_FEATURES'><glossterm>CONFLICT_MACHINE_FEATURES</glossterm>
+            <info>
+                CONFLICT_MACHINE_FEATURES[doc] = "When a recipe inherits the features_check class, this variable identifies machine features that would be in conflict should the recipe be built."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    When inheriting the
+                    <link linkend='ref-classes-features_check'><filename>features_check</filename></link>
+                    class, this variable identifies machine features that would
+                    be in conflict should the recipe be built.
+                    In other words, if the <filename>CONFLICT_MACHINE_FEATURES</filename> variable
+                    lists a feature that also appears in
+                    <filename>MACHINE_FEATURES</filename> within the
+                    current configuration, an error occurs and the
+                    build stops.
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-COPYLEFT_LICENSE_EXCLUDE'><glossterm>COPYLEFT_LICENSE_EXCLUDE</glossterm>
             <info>
                 COPYLEFT_LICENSE_EXCLUDE[doc] = "Licenses to exclude in the source archived by the archiver class."
@@ -11596,23 +11685,64 @@
             </glossdef>
         </glossentry>

+        <glossentry id='var-REQUIRED_COMBINED_FEATURES'><glossterm>REQUIRED_COMBINED_FEATURES</glossterm>
+            <info>
+                REQUIRED_COMBINED_FEATURES[doc] = "When a recipe inherits the features_check class, this variable identifies combined features that must exist in the current configuration in order for the OpenEmbedded build system to build the recipe."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    When inheriting the
+                    <link linkend='ref-classes-features_check'><filename>features_check</filename></link>
+                    class, this variable identifies combined features that must
+                    exist in the current configuration in order for the
+                    OpenEmbedded build system to build the recipe.
+                    In other words, if the
+                    <filename>REQUIRED_COMBINED_FEATURES</filename> variable
+                    lists a feature that does not appear in
+                    <link linkend='var-COMBINED_FEATURES'><filename>COMBINED_FEATURES</filename></link>
+                    within the current configuration, an error occurs and the
+                    build stops.
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-REQUIRED_DISTRO_FEATURES'><glossterm>REQUIRED_DISTRO_FEATURES</glossterm>
             <info>
-                REQUIRED_DISTRO_FEATURES[doc] = "When a recipe inherits the distro_features_check class, this variable identifies distribution features that must exist in the current configuration in order for the OpenEmbedded build system to build the recipe."
+                REQUIRED_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class, this variable identifies distribution features that must exist in the current configuration in order for the OpenEmbedded build system to build the recipe."
             </info>
             <glossdef>
                 <para role="glossdeffirst">
                     When inheriting the
-                    <link linkend='ref-classes-distro_features_check'><filename>distro_features_check</filename></link>
-                    class, this
-                    variable identifies distribution features that must
+                    <link linkend='ref-classes-features_check'><filename>features_check</filename></link>
+                    class, this variable identifies distribution features that must
                     exist in the current configuration in order for the
                     OpenEmbedded build system to build the recipe.
                     In other words, if the
                     <filename>REQUIRED_DISTRO_FEATURES</filename> variable
                     lists a feature that does not appear in
-                    <filename>DISTRO_FEATURES</filename> within the
-                    current configuration, an error occurs and the
+                    <link linkend='var-DISTRO_FEATURES'><filename>DISTRO_FEATURES</filename></link>
+                    within the current configuration, an error occurs and the
+                    build stops.
+                </para>
+            </glossdef>
+        </glossentry>
+
+        <glossentry id='var-REQUIRED_MACHINE_FEATURES'><glossterm>REQUIRED_MACHINE_FEATURES</glossterm>
+            <info>
+                REQUIRED_MACHINE_FEATURES[doc] = "When a recipe inherits the features_check class, this variable identifies machine features that must exist in the current configuration in order for the OpenEmbedded build system to build the recipe."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    When inheriting the
+                    <link linkend='ref-classes-features_check'><filename>features_check</filename></link>
+                    class, this variable identifies machine features that must
+                    exist in the current configuration in order for the
+                    OpenEmbedded build system to build the recipe.
+                    In other words, if the
+                    <filename>REQUIRED_MACHINE_FEATURES</filename> variable
+                    lists a feature that does not appear in
+                    <link linkend='var-MACHINE_FEATURES'><filename>MACHINE_FEATURES</filename></link>
+                    within the current configuration, an error occurs and the
                     build stops.
                 </para>
             </glossdef>

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
