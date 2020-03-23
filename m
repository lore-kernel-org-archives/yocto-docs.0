Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.52993.1584971876673248248
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 06:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:49136 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jGNaV-006gWr-08
	for docs@lists.yoctoproject.org; Mon, 23 Mar 2020 09:57:55 -0400
Date: Mon, 23 Mar 2020 09:57:52 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: update PROVIDES example, clarify use of "+="
Message-ID: <alpine.LFD.2.21.2003230956160.15521@localhost.localdomain>
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

Update the example used in explaining the PROVIDES variable to one
that actually exists, and point out that "+=" is unnecessary, a simple
assignment is sufficient.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 7ab37de31..b3ecfed09 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -11544,23 +11544,35 @@
                     By default, a recipe's own
                     <filename><link linkend='var-PN'>PN</link></filename>
                     is implicitly already in its <filename>PROVIDES</filename>
-                    list.
+                    list and therefore does not need to mention that it provides itself.
                     If a recipe uses <filename>PROVIDES</filename>, the
                     additional aliases are synonyms for the recipe and can
-                    be useful satisfying dependencies of other recipes during
+                    be useful for satisfying dependencies of other recipes during
                     the build as specified by
                     <filename><link linkend='var-DEPENDS'>DEPENDS</link></filename>.
                 </para>

                 <para>
                     Consider the following example
-                    <filename>PROVIDES</filename> statement from a recipe
-                    file <filename>libav_0.8.11.bb</filename>:
+                    <filename>PROVIDES</filename> statement from the recipe
+                    file <filename>eudev_3.2.9.bb</filename>:
                     <literallayout class='monospaced'>
-     PROVIDES += "libpostproc"
+     PROVIDES = "udev"
                     </literallayout>
                     The <filename>PROVIDES</filename> statement results in
-                    the "libav" recipe also being known as "libpostproc".
+                    the "eudev" recipe also being available as simply "udev".
+
+                    <note>
+                        Given that a recipe's own recipe name is already
+                        implicitly in its own <filename>PROVIDES</filename> list,
+                        it is unnecessary to add aliases with the "+=" operator;
+                        using a simple assignment will be sufficient. In other
+                        words, while you could write:
+                        <literallayout class='monospaced'>
+     PROVIDES += "udev"
+                        </literallayout>
+                        in the above, the "+=" is overkill and unnecessary.
+                    </note>
                 </para>

                 <para>

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
