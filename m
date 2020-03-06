Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.1831.1583454503853954617
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2020 16:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:33776 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jA0qi-000qvK-7W; Thu, 05 Mar 2020 19:28:21 -0500
Date: Thu, 5 Mar 2020 19:28:17 -0500 (EST)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] update YP manual notes with pointer to docs ML
Message-ID: <alpine.LFD.2.21.2003051923230.14406@localhost.localdomain>
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


Update the "Manual Notes" section of numerous YP manuals with a
reference to the recently-introduced YP documentation mailing list.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
index b9196f1e8..ea4899b70 100755
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -174,13 +174,15 @@
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
                        </para></listitem>
-                   <listitem><para>
+                   <listitem>
+                       <para>
                        To report any inaccuracies or problems with this
-                       manual, send an email to the Yocto Project
-                       discussion group at
-                       <filename>yocto@yoctoproject.com</filename> or log into
-                       the freenode <filename>#yocto</filename> channel.
-                       </para></listitem>
+                       (or any other Yocto Project) manual, send an email to
+                       the Yocto Project documentation mailing list at
+                       <filename>docs@lists.yoctoproject.org</filename> or
+                       log into the freenode <filename>#yocto</filename> channel.
+                       </para>
+                   </listitem>
                </itemizedlist>
            </note>
     </legalnotice>
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index ffeb2150e..2ef7087cd 100755
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -166,13 +166,15 @@
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
                        </para></listitem>
-                   <listitem><para>
+                   <listitem>
+                       <para>
                        To report any inaccuracies or problems with this
-                       manual, send an email to the Yocto Project
-                       discussion group at
-                       <filename>yocto@yoctoproject.com</filename> or log into
-                       the freenode <filename>#yocto</filename> channel.
-                       </para></listitem>
+                       (or any other Yocto Project) manual, send an email to
+                       the Yocto Project documentation mailing list at
+                       <filename>docs@lists.yoctoproject.org</filename> or
+                       log into the freenode <filename>#yocto</filename> channel.
+                       </para>
+                   </listitem>
                </itemizedlist>
            </note>
     </legalnotice>
diff --git a/documentation/kernel-dev/kernel-dev.xml b/documentation/kernel-dev/kernel-dev.xml
index 31c8f839a..e0aed297d 100755
--- a/documentation/kernel-dev/kernel-dev.xml
+++ b/documentation/kernel-dev/kernel-dev.xml
@@ -149,13 +149,15 @@
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
                        </para></listitem>
-                   <listitem><para>
+                   <listitem>
+                       <para>
                        To report any inaccuracies or problems with this
-                       manual, send an email to the Yocto Project
-                       discussion group at
-                       <filename>yocto@yoctoproject.com</filename> or log into
-                       the freenode <filename>#yocto</filename> channel.
-                       </para></listitem>
+                       (or any other Yocto Project) manual, send an email to
+                       the Yocto Project documentation mailing list at
+                       <filename>docs@lists.yoctoproject.org</filename> or
+                       log into the freenode <filename>#yocto</filename> channel.
+                       </para>
+                   </listitem>
                </itemizedlist>
            </note>
     </legalnotice>
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index b0ac88dca..13ada7c03 100755
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -140,13 +140,15 @@
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
                        </para></listitem>
-                   <listitem><para>
+                   <listitem>
+                       <para>
                        To report any inaccuracies or problems with this
-                       manual, send an email to the Yocto Project
-                       discussion group at
-                       <filename>yocto@yoctoproject.com</filename> or log into
-                       the freenode <filename>#yocto</filename> channel.
-                       </para></listitem>
+                       (or any other Yocto Project) manual, send an email to
+                       the Yocto Project documentation mailing list at
+                       <filename>docs@lists.yoctoproject.org</filename> or
+                       log into the freenode <filename>#yocto</filename> channel.
+                       </para>
+                   </listitem>
                </itemizedlist>
            </note>

diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
index 4001393db..dfdc165a6 100755
--- a/documentation/overview-manual/overview-manual.xml
+++ b/documentation/overview-manual/overview-manual.xml
@@ -101,13 +101,15 @@
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
                        </para></listitem>
-                   <listitem><para>
+                   <listitem>
+                       <para>
                        To report any inaccuracies or problems with this
-                       manual, send an email to the Yocto Project
-                       discussion group at
-                       <filename>yocto@yoctoproject.com</filename> or log into
-                       the freenode <filename>#yocto</filename> channel.
-                       </para></listitem>
+                       (or any other Yocto Project) manual, send an email to
+                       the Yocto Project documentation mailing list at
+                       <filename>docs@lists.yoctoproject.org</filename> or
+                       log into the freenode <filename>#yocto</filename> channel.
+                       </para>
+                   </listitem>
                </itemizedlist>
            </note>
     </legalnotice>
diff --git a/documentation/profile-manual/profile-manual.xml b/documentation/profile-manual/profile-manual.xml
index a70621a9b..14c508ea1 100755
--- a/documentation/profile-manual/profile-manual.xml
+++ b/documentation/profile-manual/profile-manual.xml
@@ -151,13 +151,15 @@
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
                        </para></listitem>
-                   <listitem><para>
+                   <listitem>
+                       <para>
                        To report any inaccuracies or problems with this
-                       manual, send an email to the Yocto Project
-                       discussion group at
-                       <filename>yocto@yoctoproject.com</filename> or log into
-                       the freenode <filename>#yocto</filename> channel.
-                       </para></listitem>
+                       (or any other Yocto Project) manual, send an email to
+                       the Yocto Project documentation mailing list at
+                       <filename>docs@lists.yoctoproject.org</filename> or
+                       log into the freenode <filename>#yocto</filename> channel.
+                       </para>
+                   </listitem>
                </itemizedlist>
            </note>
     </legalnotice>
diff --git a/documentation/ref-manual/ref-manual.xml b/documentation/ref-manual/ref-manual.xml
index ac15812fe..48358aae5 100755
--- a/documentation/ref-manual/ref-manual.xml
+++ b/documentation/ref-manual/ref-manual.xml
@@ -175,13 +175,15 @@
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
                        </para></listitem>
-                   <listitem><para>
+                   <listitem>
+                       <para>
                        To report any inaccuracies or problems with this
-                       manual, send an email to the Yocto Project
-                       discussion group at
-                       <filename>yocto@yoctoproject.com</filename> or log into
-                       the freenode <filename>#yocto</filename> channel.
-                       </para></listitem>
+                       (or any other Yocto Project) manual, send an email to
+                       the Yocto Project documentation mailing list at
+                       <filename>docs@lists.yoctoproject.org</filename> or
+                       log into the freenode <filename>#yocto</filename> channel.
+                       </para>
+                   </listitem>
                </itemizedlist>
            </note>
     </legalnotice>
diff --git a/documentation/sdk-manual/sdk-manual.xml b/documentation/sdk-manual/sdk-manual.xml
index 6400f724b..b00547c1a 100755
--- a/documentation/sdk-manual/sdk-manual.xml
+++ b/documentation/sdk-manual/sdk-manual.xml
@@ -119,13 +119,15 @@
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
                        </para></listitem>
-                   <listitem><para>
+                   <listitem>
+                       <para>
                        To report any inaccuracies or problems with this
-                       manual, send an email to the Yocto Project
-                       discussion group at
-                       <filename>yocto@yoctoproject.com</filename> or log into
-                       the freenode <filename>#yocto</filename> channel.
-                       </para></listitem>
+                       (or any other Yocto Project) manual, send an email to
+                       the Yocto Project documentation mailing list at
+                       <filename>docs@lists.yoctoproject.org</filename> or
+                       log into the freenode <filename>#yocto</filename> channel.
+                       </para>
+                   </listitem>
                </itemizedlist>
            </note>
     </legalnotice>
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index 1d7b98b56..d38137c8a 100755
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -129,13 +129,15 @@
                        "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARCHIVE"
                        pull-down menus.
                        </para></listitem>
-                   <listitem><para>
+                   <listitem>
+                       <para>
                        To report any inaccuracies or problems with this
-                       manual, send an email to the Yocto Project
-                       discussion group at
-                       <filename>yocto@yoctoproject.com</filename> or log into
-                       the freenode <filename>#yocto</filename> channel.
-                       </para></listitem>
+                       (or any other Yocto Project) manual, send an email to
+                       the Yocto Project documentation mailing list at
+                       <filename>docs@lists.yoctoproject.org</filename> or
+                       log into the freenode <filename>#yocto</filename> channel.
+                       </para>
+                   </listitem>
                </itemizedlist>
            </note>


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
