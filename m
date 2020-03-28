Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.7118.1585406749746443262
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Mar 2020 07:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:43660 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jICiZ-008IiL-Du
	for docs@lists.yoctoproject.org; Sat, 28 Mar 2020 10:45:48 -0400
Date: Sat, 28 Mar 2020 10:45:45 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: minor tweaks, rewording, grammar for chapter 2
Message-ID: <alpine.LFD.2.21.2003281044390.7971@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=0.3
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


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/dev-manual-start.xml b/documentation/dev-manual/dev-manual-start.xml
index 59ffa49bb..09c6e2996 100644
--- a/documentation/dev-manual/dev-manual-start.xml
+++ b/documentation/dev-manual/dev-manual-start.xml
@@ -7,7 +7,7 @@
 <title>Setting Up to Use the Yocto Project</title>

 <para>
-    This chapter provides procedures related to getting set up to use the
+    This chapter provides guidance on how to prepare to use the
     Yocto Project.
     You can learn about creating a team environment that develops using the
     Yocto Project, how to set up a
@@ -24,9 +24,9 @@
         Project in a team development environment, or how to scale it for a
         large team of developers.
         You can adapt the Yocto Project to many different use cases and
-        scenarios.
-        However, this flexibility could cause difficulties if you are trying
-        to create a working setup that scales across a large team.
+        scenarios;
+        however, this flexibility could cause difficulties if you are trying
+        to create a working setup that scales effectively.
     </para>

     <para>
@@ -35,17 +35,17 @@
         that can help you get the results you want.
         The procedure is high-level and presents some of the project's most
         successful experiences, practices, solutions, and available
-        technologies that have proved to work well in the past.
-        Keep in mind, the procedure here is a starting point.
+        technologies that have proved to work well in the past;
+        however, keep in mind, the procedure here is simply a starting point.
         You can build off these steps and customize the procedure to fit any
         particular working environment and set of practices.
         <orderedlist>
             <listitem><para>
                 <emphasis>Determine Who is Going to be Developing:</emphasis>
-                You need to understand who is going to be doing anything
+                You first need to understand who is going to be doing anything
                 related to the Yocto Project and determine their roles.
                 Making this determination is essential to completing
-                steps two and three, which are to get your equipment together
+                subsequent steps, which are to get your equipment together
                 and set up your development environment's hardware topology.
                 </para>

@@ -64,8 +64,8 @@
                         <listitem><para>
                             <emphasis>Build Engineer:</emphasis>
                             This type of developer manages Autobuilders and
-                            releases.
-                            Not all environments need a Build Engineer.
+                            releases. Depending on the specifics of the environment,
+                            not all situations might need a Build Engineer.
                             </para></listitem>
                         <listitem><para>
                             <emphasis>Test Engineer:</emphasis>
@@ -88,6 +88,11 @@
                 You can help ensure efficiency by having any machines used
                 for testing or that run Autobuilders be as high performance
                 as possible.
+                <note>
+                    Given sufficient processing power, you might also consider
+                    building Yocto Project development containers to be run
+                    under Docker, which is described later.
+                </note>
                 </para></listitem>
             <listitem><para>
                 <emphasis>Understand the Hardware Topology of the Environment:</emphasis>
@@ -114,10 +119,10 @@
                 and any software you are developing under the control of an SCM
                 system that is compatible   with the OpenEmbedded build system
                 is advisable.
-                Of the SCMs BitBake supports, the Yocto Project team strongly
+                Of all of the SCMs supported by BitBake, the Yocto Project team strongly
                 recommends using
                 <ulink url='&YOCTO_DOCS_OM_URL;#git'>Git</ulink>.
-                Git is a distributed system that is easy to backup,
+                Git is a distributed system that is easy to back up,
                 allows you to work remotely, and then connects back to the
                 infrastructure.
                 <note>
@@ -302,7 +307,7 @@
                 <para>As with any development environment, it is important
                 to document the policy used as well as any main project
                 guidelines so they are understood by everyone.
-                It is also a good idea to have well structured
+                It is also a good idea to have well-structured
                 commit messages, which are usually a part of a project's
                 guidelines.
                 Good commit messages are essential when looking back in time and
@@ -442,7 +447,7 @@
                     You should have a reasonably current Linux-based host
                     system.
                     You will have the best results with a recent release of
-                    Fedora, openSUSE, Debian, Ubuntu, or CentOS as these
+                    Fedora, openSUSE, Debian, Ubuntu, RHEL or CentOS as these
                     releases are frequently tested against the Yocto Project
                     and officially supported.
                     For a list of the distributions under validation and their
@@ -660,9 +665,8 @@
     <title>Locating Yocto Project Source Files</title>

     <para>
-        This section shows you how to locate and access the
-        source files that ship with the Yocto Project.
-        You establish and use these local files to work on projects.
+        This section shows you how to locate, fetch and configure the source
+        files you'll need to work with the Yocto Project.
         <note><title>Notes</title>
             <itemizedlist>
                 <listitem><para>
@@ -1019,20 +1023,18 @@
            .
            .
            .
-       remotes/origin/pyro
-       remotes/origin/pyro-next
-       remotes/origin/rocko
-       remotes/origin/rocko-next
-       remotes/origin/sumo
-       remotes/origin/sumo-next
        remotes/origin/thud
        remotes/origin/thud-next
        remotes/origin/warrior
+       remotes/origin/warrior-next
+       remotes/origin/zeus
+       remotes/origin/zeus-next
+       ... and so on ...
                     </literallayout>
                     </para></listitem>
                 <listitem><para>
-                    <emphasis>Checkout the Branch:</emphasis>
-                    Checkout the development branch in which you want to work.
+                    <emphasis>Check out the Branch:</emphasis>
+                    Check out the development branch in which you want to work.
                     For example, to access the files for the Yocto Project
                     &DISTRO; Release (&DISTRO_NAME;), use the following command:
                     <literallayout class='monospaced'>
@@ -1118,7 +1120,7 @@
                     </literallayout>
                     </para></listitem>
                 <listitem><para>
-                    <emphasis>Checkout the Branch:</emphasis>
+                    <emphasis>Check out the Branch:</emphasis>
                     <literallayout class='monospaced'>
      $ git checkout tags/&DISTRO_REL_TAG; -b my_yocto_&DISTRO;
      Switched to a new branch 'my_yocto_&DISTRO;'

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
