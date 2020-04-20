Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web11.36.1587414002750797308
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2020 13:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz.suevie (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 495dNJ5bPcz5tlB;
	Mon, 20 Apr 2020 22:20:00 +0200 (CEST)
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@streamunlimited.com>
Subject: [PATCH] ref-manual: document new unlisted-pkg-lics insane-skip qa check
Date: Mon, 20 Apr 2020 22:19:37 +0200
Message-Id: <20200420201937.32178-1-quentin.schulz@streamunlimited.com>
X-Mailer: git-send-email 2.17.1

The new unlisted-pkg-lics INSANE_SKIP QA check was introduced and need
proper documentation.

This QA check makes sure all licenses listed for all packages built by a
recipe are declared in the recipe LICENSE variable.

Signed-off-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
---

please wait for the patch to be merged:
https://lists.openembedded.org/g/openembedded-core/message/137330

 documentation/ref-manual/ref-classes.xml   |  6 ++++++
 documentation/ref-manual/ref-qa-checks.xml | 25 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index f9bbddd724..f8920d8c1b 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -1742,6 +1742,12 @@ This check was removed for YP 2.3 release
                 </note>
                 </para></listitem>
 -->
+            <listitem><para><emphasis><filename>unlisted-pkg-lics:</filename></emphasis>
+                Checks that all declared licenses applying for a package are also
+                declared on the recipe level (i.e. any license in
+                <filename>LICENSE_*</filename> should appear in
+                <link linkend='var-LICENSE'><filename>LICENSE</filename></link>).
+                </para></listitem>
             <listitem><para><emphasis><filename>useless-rpaths:</filename></emphasis>
                 Checks for dynamic library load paths (rpaths) in the binaries that
                 by default on a standard system are searched by the linker (e.g.
diff --git a/documentation/ref-manual/ref-qa-checks.xml b/documentation/ref-manual/ref-qa-checks.xml
index 515106ae68..424a19c59d 100644
--- a/documentation/ref-manual/ref-qa-checks.xml
+++ b/documentation/ref-manual/ref-qa-checks.xml
@@ -1170,6 +1170,31 @@ can be found then it should be implemented.  I can't find one at the moment.
             </listitem>
         </itemizedlist>
     </para>
+
+    <para>
+        <itemizedlist>
+            <listitem>
+                <para id='qa-issue-unlisted-pkg-lics'>
+                    <code>
+     LICENSE_&lt;packagename&gt; includes licenses (&lt;licenses&gt;) that are not listed in LICENSE [unlisted-pkg-lics]
+                    </code>
+                </para>
+
+                <para>
+                    The <link linkend='var-LICENSE'><filename>LICENSE</filename></link>
+		    of the recipe should be a superset of all the licenses of
+		    all packages produced by this recipe.
+		    In other words, any license in <filename>LICENSE_*</filename>
+		    should also appear in
+                    <link linkend='var-LICENSE'><filename>LICENSE</filename></link>.
+                </para>
+
+                <para>
+                    &nbsp;
+                </para>
+            </listitem>
+        </itemizedlist>
+    </para>
 </section>
 
 <section id='configuring-and-disabling-qa-checks'>
-- 
2.17.1

