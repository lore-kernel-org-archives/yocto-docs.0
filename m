Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.2106.1586203662603166869
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 13:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:57952 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jLY1v-00F6Ja-OB
	for docs@lists.yoctoproject.org; Mon, 06 Apr 2020 16:07:36 -0400
Date: Mon, 6 Apr 2020 16:07:33 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: update PACKAGECONFIG glossary entry
Message-ID: <alpine.LFD.2.21.2004061604310.9671@localhost.localdomain>
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

Update the glossary entry for PACKAGECONFIG in two ways:

1) Explain the recent sixth argument, which identifies conflicting
   features for a given feature.
2) Use a different example, as the librsvg "croco" feature no
   longer works that way.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  not as much as could have been said, but this might need its own
section in the dev manual somewhere at some point. this should do for
now.

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 9723cbb4d..b44fdcb73 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -10417,12 +10417,20 @@
                     <filename>PACKAGECONFIG</filename> blocks are defined
                     in recipes when you specify features and then arguments
                     that define feature behaviors.
-                    Here is the basic block structure:
+                    Here is the basic block structure (broken over multiple
+                    lines for readability):
                     <literallayout class='monospaced'>
      PACKAGECONFIG ??= "f1 f2 f3 ..."
-     PACKAGECONFIG[f1] = "--with-f1,--without-f1,build-deps-f1,rt-deps-f1,rt-recs-f1"
-     PACKAGECONFIG[f2] = "--with-f2,--without-f2,build-deps-f2,rt-deps-f2,rt-recs-f2"
-     PACKAGECONFIG[f3] = "--with-f3,--without-f3,build-deps-f3,rt-deps-f3,rt-recs-f3"
+     PACKAGECONFIG[f1] = "\
+                          --with-f1, \
+                          --without-f1, \
+                          build-deps-for-f1, \
+                          runtime-deps-for-f1, \
+                          runtime-recommends-for-f1, \
+                          packageconfig-conflicts-for-f1 \
+                          "
+     PACKAGECONFIG[f2] = "\
+                         ... and so on and so on ...
                     </literallayout>
                 </para>

@@ -10431,7 +10439,7 @@
                     variable itself specifies a space-separated list of the
                     features to enable.
                     Following the features, you can determine the behavior of
-                    each feature by providing up to five order-dependent
+                    each feature by providing up to six order-dependent
                     arguments, which are separated by commas.
                     You can omit any argument you like but must retain the
                     separating commas.
@@ -10461,6 +10469,10 @@
                             (<link linkend='var-RRECOMMENDS'><filename>RRECOMMENDS</filename></link>)
                             that should be added if the feature is enabled.
                             </para></listitem>
+                        <listitem><para>Any conflicting (that is, mutually
+                            exclusive) <filename>PACKAGECONFIG</filename>
+                            settings for this feature.
+                            </para></listitem>
                     </orderedlist>
                 </para>

@@ -10468,25 +10480,23 @@
                     Consider the following
                     <filename>PACKAGECONFIG</filename> block taken from the
                     <filename>librsvg</filename> recipe.
-                    In this example the feature is <filename>croco</filename>,
+                    In this example the feature is <filename>gtk</filename>,
                     which has three arguments that determine the feature's
                     behavior.
                     <literallayout class='monospaced'>
-     PACKAGECONFIG ??= "croco"
-     PACKAGECONFIG[croco] = "--with-croco,--without-croco,libcroco"
+     PACKAGECONFIG[gtk] = "--with-gtk3,--without-gtk3,gtk+3"
                     </literallayout>
-                    The <filename>--with-croco</filename> and
-                    <filename>libcroco</filename> arguments apply only if
+                    The <filename>--with-gtk3</filename> and
+                    <filename>gtk+3</filename> arguments apply only if
                     the feature is enabled.
-                    In this case, <filename>--with-croco</filename> is
+                    In this case, <filename>--with-gtk3</filename> is
                     added to the configure script argument list and
-                    <filename>libcroco</filename> is added to
+                    <filename>gtk+3</filename> is added to
                     <filename>DEPENDS</filename>.
                     On the other hand, if the feature is disabled say through
                     a <filename>.bbappend</filename> file in another layer, then
-                    the second argument <filename>--without-croco</filename> is
-                    added to the configure script rather than
-                    <filename>--with-croco</filename>.
+                    the second argument <filename>--without-gtk3</filename> is
+                    added to the configure script instead.
                 </para>

                 <para>

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
