Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2816FD2168F
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 15:23:17 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46037.1764861795656010560
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 07:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ad7QgEC5;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 797E34E41A2B
	for <docs@lists.yoctoproject.org>; Thu,  4 Dec 2025 15:23:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4AAEA6068C
	for <docs@lists.yoctoproject.org>; Thu,  4 Dec 2025 15:23:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 306DC119227F7;
	Thu,  4 Dec 2025 16:23:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764861792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RjbUj0BMKk6/8x3sHcWZrS1AfmlNYKaBdKRVVXNj0zM=;
	b=Ad7QgEC5q+rC+MPf4kzAgH0F+cIFjMyVGELIRVa9kpdjiVYwGMtU2S92NF9xYHnLot7iYz
	Nary/458JeCrZhsDx19LmNUVjXC4aQxh+/TY7fQRZD/3g+h4yEa+GX4V48fDuI6/cuIkiA
	Q6OZTkpTcInPMdZGb5Cz6eNM7cPHjyS3zJArBTtFsR856M49MW4FKYxGZwCmKsvY1QtgbU
	hXRJ+vutSbCWeY0o+mB3Dfqv3ARXcZkYCNnw2h1ZpvLGOJ4o1l0rdaFKuscqKixqymZcC9
	zD8Keq9zbQx7bF3KwxGh0p3BnZLAGKa1x4ZD+sYZNt7U4AglB7w1dYUQ/WjNog==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 04 Dec 2025 16:23:05 +0100
Subject: [PATCH] Add a new "Security" section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-reorg-security-section-v1-1-75aeeb741c83@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAFinMWkC/yWMQQqDMBBFryKzbsAkNQSvIl20dtRxoTITS4vk7
 p3o7j/47x0gyIQCbXUA44eE1kXB3irop+cyoqG3MrjaNdbVd8O48mgE+50p/cpIqhiMQwjBRh+
 tB5U3xoG+Z7h7XCz7a9Z3qUHOf7eM4PF6AAAA
X-Change-ID: 20251204-reorg-security-section-e8f666183813
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=24855;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/KgEj0d3pv6dc7u1YKrksMEOj1THcuEqbC7NmPSkU/4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpMadewVs1e0nEP3RdQGjssmu2PS/0cl202xSJA
 p0Eg/z8AD6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTGnXgAKCRDRgEFAKaOo
 NoosD/97Eok2yXC9HNw6b0VDuzP/OtC1AdDxwQnR8fKTq0tUktop4j7KRLn1Oh0zJNg5BJM5USq
 C3cKxlP2adVS3xASFwJGYJFERJKeokyqa9vktfBpO7nZUHKWG9zfViO86AfI6jPz7MQq9sY4kEZ
 A12oGiKsHYkhncloOUhtFzzXRXNh+qNkKcpGjTyOErtGbs/yDFthOERA+Tqu8zD/eu84H0UNEa1
 2h77HN24SARGlclPB7a5kYvF9jEVJfbo8wWsuYfVO8EORiylHDi3aM/abRleMKt9lwbzxmfNeN4
 5G/rat+KIT5PH9hyI0XrqiDHz55xYfbPQ8PaQoz6S5WigTTeBBOmhj8Tk7rdYTWr7nFarrSDpKW
 IHZey9h1/oPWa0z39Su2Zz3Ww+s0TLOG77XeZr6DInLQrMeU4yurmKsVMlFUIOlbtrCmCbcbj79
 BJR/V0Wi7iqAqrudYZ8l0V6OwWaU4JBJhA4DhIBpx/sCZhzZJVaXtNydg/Y/eJ0qiyTA3Ai4mW8
 vy/V6UgcUJ667hFi/qev94C6thcoiWY+WyBPNEfqP9WqDk7M2FX9OSofvlnqaryrXIuS5E8thlG
 j21zeJSZ+dce6kRqRMldqEVjV6kyRR9oDXk89flD7LUaBe7bKdeJZzYj/NEmgTt3ZSgyXvA/1xv
 QfaYy3xVc4HGNKw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Dec 2025 15:23:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8222

The current security-related documentation is a bit hard to find and
hidden within the development manual. However these are processes that
are not part of a development task but is rather a vulnerability
reporting process.

Create a new "Security" section in the documentation to gather this
information. This will be directly visible in the sidebar when opening
the documentation.

Split the previous security-subjects.rst document into 2 documents:

- security-team.rst: defines the roles of the security teams and its
  members.

- reporting-vulnerabilities.rst: guide to report vulnerabilities to the
  security team.

The plan is to backport these documents to active releases. As a
consequence, this section should be free of instructions and information
that only make sense for a specific release. It should _not_ contain
documents on how to enable security features with Yocto on target
devices, this is unrelated and can be left in the development manual
(for example: dev-manual/vulnerabilities.rst to deal with CVEs).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/index.rst                 |   1 -
 documentation/dev-manual/security-subjects.rst     | 194 ---------------------
 documentation/index.rst                            |   7 +-
 .../migration-guides/release-notes-4.3.rst         |   2 +-
 documentation/security-reference/index.rst         |  14 ++
 .../reporting-vulnerabilities.rst                  |  85 +++++++++
 documentation/security-reference/security-team.rst | 110 ++++++++++++
 7 files changed, 216 insertions(+), 197 deletions(-)

diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
index adf776e00..e786ddf8f 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -46,7 +46,6 @@ Yocto Project Development Tasks Manual
    build-quality
    debugging
    licenses
-   security-subjects
    vulnerabilities
    sbom
    error-reporting-tool
diff --git a/documentation/dev-manual/security-subjects.rst b/documentation/dev-manual/security-subjects.rst
deleted file mode 100644
index 1ec7c8b38..000000000
--- a/documentation/dev-manual/security-subjects.rst
+++ /dev/null
@@ -1,194 +0,0 @@
-.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
-
-Dealing with Vulnerability Reports
-**********************************
-
-The Yocto Project and OpenEmbedded are open-source, community-based projects
-used in numerous products. They assemble multiple other open-source projects,
-and need to handle security issues and practices both internal (in the code
-maintained by both projects), and external (maintained by other projects and
-organizations).
-
-This manual assembles security-related information concerning the whole
-ecosystem. It includes information on reporting a potential security issue,
-the operation of the YP Security team and how to contribute in the
-related code. It is written to be useful for both security researchers and
-YP developers.
-
-How to report a potential security vulnerability?
-=================================================
-
-If you would like to report a public issue (for example, one with a released
-CVE number), please report it using the
-:yocto_bugs:`Security Bugzilla </enter_bug.cgi?product=Security>`.
-
-If you are dealing with a not-yet-released issue, or an urgent one, please send
-a message to security AT yoctoproject DOT org, including as many details as
-possible: the layer or software module affected, the recipe and its version,
-and any example code, if available. This mailing list is monitored by the
-Yocto Project Security team.
-
-For each layer, you might also look for specific instructions (if any) for
-reporting potential security issues in the specific ``SECURITY.md`` file at the
-root of the repository. Instructions on how and where submit a patch are
-usually available in ``README.md``. If this is your first patch to the
-Yocto Project/OpenEmbedded, you might want to have a look into the
-Contributor's Manual section
-":ref:`contributor-guide/submit-changes:preparing changes for submission`".
-
-Branches maintained with security fixes
----------------------------------------
-
-See the
-:ref:`Release process <ref-manual/release-process:Stable Release Process>`
-documentation for details regarding the policies and maintenance of stable
-branches.
-
-The :yocto_home:`Releases </development/releases/>` page contains a list of all
-releases of the Yocto Project, grouped into current and previous releases.
-Previous releases are no longer actively maintained with security patches, but
-well-tested patches may still be accepted for them for significant issues.
-
-Security-related discussions at the Yocto Project
--------------------------------------------------
-
-We have set up two security-related emails/mailing lists:
-
-  -  Public Mailing List: yocto [dash] security [at] yoctoproject[dot] org
-
-     This is a public mailing list for anyone to subscribe to. This list is an
-     open list to discuss public security issues/patches and security-related
-     initiatives. For more information, including subscription information,
-     please see the  :yocto_lists:`yocto-security mailing list info page
-     </g/yocto-security>`.
-
-     This list requires moderator approval for new topics to be posted, to avoid
-     private security reports to be posted by mistake.
-
-  -  Yocto Project Security Team: security [at] yoctoproject [dot] org
-
-     This is an email for reporting non-published potential vulnerabilities.
-     Emails sent to this address are forwarded to the Yocto Project Security
-     Team members.
-
-
-What you should do if you find a security vulnerability
--------------------------------------------------------
-
-If you find a security flaw: a crash, an information leakage, or anything that
-can have a security impact if exploited in any Open Source software built or
-used by the Yocto Project, please report this to the Yocto Project Security
-Team. If you prefer to contact the upstream project directly, please send a
-copy to the security team at the Yocto Project as well. If you believe this is
-highly sensitive information, please report the vulnerability in a secure way,
-i.e. encrypt the email and send it to the private list. This ensures that
-the exploit is not leaked and exploited before a response/fix has been generated.
-
-Security team
-=============
-
-The Yocto Project/OpenEmbedded security team coordinates the work on security
-subjects in the project. All general discussion takes place publicly. The
-Security Team only uses confidential communication tools to deal with private
-vulnerability reports before they are released.
-
-Security team appointment
--------------------------
-
-The Yocto Project Security Team consists of at least three members. When new
-members are needed, the Yocto Project Technical Steering Committee (YP TSC)
-asks for nominations by public channels including a nomination deadline.
-Self-nominations are possible. When the limit time is
-reached, the YP TSC posts the list of candidates for the comments of project
-participants and developers. Comments may be sent publicly or privately to the
-YP and OE TSCs. The candidates are approved by both YP TSC and OpenEmbedded
-Technical Steering Committee (OE TSC) and the final list of the team members
-is announced publicly. The aim is to have people representing technical
-leadership, security knowledge and infrastructure present with enough people
-to provide backup/coverage but keep the notification list small enough to
-minimize information risk and maintain trust.
-
-YP Security Team members may resign at any time.
-
-Security Team Operations
-------------------------
-
-The work of the Security Team might require high confidentiality. Team members
-are individuals selected by merit and do not represent the companies they work
-for. They do not share information about confidential issues outside of the team
-and do not hint about ongoing embargoes.
-
-Team members can bring in domain experts as needed. Those people should be
-added to individual issues only and adhere to the same standards as the YP
-Security Team.
-
-The YP security team organizes its meetings and communication as needed.
-
-When the YP Security team receives a report about a potential security
-vulnerability, they quickly analyze and notify the reporter of the result.
-They might also request more information.
-
-If the issue is confirmed and affects the code maintained by the YP, they
-confidentially notify maintainers of that code and work with them to prepare
-a fix.
-
-If the issue is confirmed and affects an upstream project, the YP security team
-notifies the project. Usually, the upstream project analyzes the problem again.
-If they deem it a real security problem in their software, they develop and
-release a fix following their security policy. They may want to include the
-original reporter in the loop. There is also sometimes some coordination for
-handling patches, backporting patches etc, or just understanding the problem
-or what caused it.
-
-When the fix is publicly available, the YP security team member or the
-package maintainer sends patches against the YP code base, following usual
-procedures, including public code review.
-
-What Yocto Security Team does when it receives a security vulnerability
------------------------------------------------------------------------
-
-The YP Security Team team performs a quick analysis and would usually report
-the flaw to the upstream project. Normally the upstream project analyzes the
-problem. If they deem it a real security problem in their software, they
-develop and release a fix following their own security policy. They may want
-to include the original reporter in the loop. There is also sometimes some
-coordination for handling patches, backporting patches etc, or just
-understanding the problem or what caused it.
-
-The security policy of the upstream project might include a notification to
-Linux distributions or other important downstream projects in advance to
-discuss coordinated disclosure. These mailing lists are normally non-public.
-
-When the upstream project releases a version with the fix, they are responsible
-for contacting `Mitre <https://www.cve.org/>`__ to get a CVE number assigned and
-the CVE record published.
-
-If an upstream project does not respond quickly
------------------------------------------------
-
-If an upstream project does not fix the problem in a reasonable time,
-the Yocto's Security Team will contact other interested parties (usually
-other distributions) in the community and together try to solve the
-vulnerability as quickly as possible.
-
-The Yocto Project Security team adheres to the 90 days disclosure policy
-by default. An increase of the embargo time is possible when necessary.
-
-Current Security Team members
------------------------------
-
-For secure communications, please send your messages encrypted using the GPG
-keys. Remember, message headers are not encrypted so do not include sensitive
-information in the subject line.
-
-  -  Ross Burton: <ross@burtonini.com> `Public key <https://keys.openpgp.org/search?q=ross%40burtonini.com>`__
-
-  -  Michael Halstead: <mhalstead [at] linuxfoundation [dot] org>
-     `Public key <https://pgp.mit.edu/pks/lookup?op=vindex&search=0x3373170601861969>`__
-     or `Public key <https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xd1f2407285e571ed12a407a73373170601861969>`__
-
-  -  Richard Purdie: <richard.purdie@linuxfoundation.org> `Public key <https://keys.openpgp.org/search?q=richard.purdie%40linuxfoundation.org>`__
-
-  -  Marta Rybczynska: <marta DOT rybczynska [at] syslinbit [dot] com> `Public key <https://keys.openpgp.org/search?q=marta.rybczynska@syslinbit.com>`__
-
-  -  Steve Sakoman: <steve [at] sakoman [dot] com> `Public key <https://keys.openpgp.org/search?q=steve%40sakoman.com>`__
diff --git a/documentation/index.rst b/documentation/index.rst
index 6c6be38a7..037edcee6 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -20,7 +20,6 @@ Welcome to the Yocto Project Documentation
    Yocto Project Software Overview <https://www.yoctoproject.org/software-overview/>
    Tips and Tricks Wiki <https://wiki.yoctoproject.org/wiki/TipsAndTricks>
 
-
 .. toctree::
    :maxdepth: 1
    :caption: Manuals
@@ -37,6 +36,12 @@ Welcome to the Yocto Project Documentation
    Test Environment Manual <test-manual/index>
    bitbake
 
+.. toctree::
+   :maxdepth: 1
+   :caption: Security
+
+   Yocto Project Security Reference <security-reference/index>
+
 .. toctree::
    :maxdepth: 1
    :caption: Release Manuals
diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index aa3f31a2c..fde9e3d02 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -274,7 +274,7 @@ New Features / Enhancements in 4.3
 
    -  New :doc:`/contributor-guide/index` document.
 
-   -  New :doc:`/dev-manual/security-subjects` chapter in the Development
+   -  New "Dealing with Vulnerability Reports" chapter in the Development
       Tasks Manual.
 
    -  Long overdue documentation for the :ref:`ref-classes-devicetree` class.
diff --git a/documentation/security-reference/index.rst b/documentation/security-reference/index.rst
new file mode 100644
index 000000000..c20a54d1a
--- /dev/null
+++ b/documentation/security-reference/index.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+================================
+Yocto Project Security Reference
+================================
+
+.. toctree::
+   :caption: Table of Contents
+   :numbered:
+
+   security-team
+   reporting-vulnerabilities
+
+.. include:: /boilerplate.rst
diff --git a/documentation/security-reference/reporting-vulnerabilities.rst b/documentation/security-reference/reporting-vulnerabilities.rst
new file mode 100644
index 000000000..0c457278d
--- /dev/null
+++ b/documentation/security-reference/reporting-vulnerabilities.rst
@@ -0,0 +1,85 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Reporting Vulnerabilities
+*************************
+
+The Yocto Project and OpenEmbedded are open-source, community-based projects
+used in numerous products. They assemble multiple other open-source projects,
+and need to handle security issues and practices both internal (in the code
+maintained by both projects), and external (maintained by other projects and
+organizations).
+
+This manual assembles security-related information concerning the whole
+ecosystem. It includes information on reporting a potential security issue,
+the operation of the YP Security team and how to contribute in the
+related code. It is written to be useful for both security researchers and
+YP developers.
+
+How to report a potential security vulnerability?
+=================================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it using the
+:yocto_bugs:`Security Bugzilla </enter_bug.cgi?product=Security>`.
+
+If you are dealing with a not-yet-released issue, or an urgent one, please send
+a message to security AT yoctoproject DOT org, including as many details as
+possible: the layer or software module affected, the recipe and its version,
+and any example code, if available. This mailing list is monitored by the
+Yocto Project Security team.
+
+For each layer, you might also look for specific instructions (if any) for
+reporting potential security issues in the specific ``SECURITY.md`` file at the
+root of the repository. Instructions on how and where submit a patch are
+usually available in ``README.md``. If this is your first patch to the
+Yocto Project/OpenEmbedded, you might want to have a look into the
+Contributor's Manual section
+":ref:`contributor-guide/submit-changes:preparing changes for submission`".
+
+Branches maintained with security fixes
+---------------------------------------
+
+See the
+:ref:`Release process <ref-manual/release-process:Stable Release Process>`
+documentation for details regarding the policies and maintenance of stable
+branches.
+
+The :yocto_home:`Releases </development/releases/>` page contains a list of all
+releases of the Yocto Project, grouped into current and previous releases.
+Previous releases are no longer actively maintained with security patches, but
+well-tested patches may still be accepted for them for significant issues.
+
+Security-related discussions at the Yocto Project
+-------------------------------------------------
+
+We have set up two security-related emails/mailing lists:
+
+  -  Public Mailing List: yocto [dash] security [at] yoctoproject[dot] org
+
+     This is a public mailing list for anyone to subscribe to. This list is an
+     open list to discuss public security issues/patches and security-related
+     initiatives. For more information, including subscription information,
+     please see the  :yocto_lists:`yocto-security mailing list info page
+     </g/yocto-security>`.
+
+     This list requires moderator approval for new topics to be posted, to avoid
+     private security reports to be posted by mistake.
+
+  -  Yocto Project Security Team: security [at] yoctoproject [dot] org
+
+     This is an email for reporting non-published potential vulnerabilities.
+     Emails sent to this address are forwarded to the Yocto Project Security
+     Team members.
+
+
+What you should do if you find a security vulnerability
+-------------------------------------------------------
+
+If you find a security flaw: a crash, an information leakage, or anything that
+can have a security impact if exploited in any Open Source software built or
+used by the Yocto Project, please report this to the Yocto Project Security
+Team. If you prefer to contact the upstream project directly, please send a
+copy to the security team at the Yocto Project as well. If you believe this is
+highly sensitive information, please report the vulnerability in a secure way,
+i.e. encrypt the email and send it to the private list. This ensures that
+the exploit is not leaked and exploited before a response/fix has been generated.
diff --git a/documentation/security-reference/security-team.rst b/documentation/security-reference/security-team.rst
new file mode 100644
index 000000000..b77365382
--- /dev/null
+++ b/documentation/security-reference/security-team.rst
@@ -0,0 +1,110 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Security team
+*************
+
+The Yocto Project/OpenEmbedded security team coordinates the work on security
+subjects in the project. All general discussion takes place publicly. The
+Security Team only uses confidential communication tools to deal with private
+vulnerability reports before they are released.
+
+Security team appointment
+=========================
+
+The Yocto Project Security Team consists of at least three members. When new
+members are needed, the Yocto Project Technical Steering Committee (YP TSC)
+asks for nominations by public channels including a nomination deadline.
+Self-nominations are possible. When the limit time is
+reached, the YP TSC posts the list of candidates for the comments of project
+participants and developers. Comments may be sent publicly or privately to the
+YP and OE TSCs. The candidates are approved by both YP TSC and OpenEmbedded
+Technical Steering Committee (OE TSC) and the final list of the team members
+is announced publicly. The aim is to have people representing technical
+leadership, security knowledge and infrastructure present with enough people
+to provide backup/coverage but keep the notification list small enough to
+minimize information risk and maintain trust.
+
+YP Security Team members may resign at any time.
+
+Security Team Operations
+========================
+
+The work of the Security Team might require high confidentiality. Team members
+are individuals selected by merit and do not represent the companies they work
+for. They do not share information about confidential issues outside of the team
+and do not hint about ongoing embargoes.
+
+Team members can bring in domain experts as needed. Those people should be
+added to individual issues only and adhere to the same standards as the YP
+Security Team.
+
+The YP security team organizes its meetings and communication as needed.
+
+When the YP Security team receives a report about a potential security
+vulnerability, they quickly analyze and notify the reporter of the result.
+They might also request more information.
+
+If the issue is confirmed and affects the code maintained by the YP, they
+confidentially notify maintainers of that code and work with them to prepare
+a fix.
+
+If the issue is confirmed and affects an upstream project, the YP security team
+notifies the project. Usually, the upstream project analyzes the problem again.
+If they deem it a real security problem in their software, they develop and
+release a fix following their security policy. They may want to include the
+original reporter in the loop. There is also sometimes some coordination for
+handling patches, backporting patches etc, or just understanding the problem
+or what caused it.
+
+When the fix is publicly available, the YP security team member or the
+package maintainer sends patches against the YP code base, following usual
+procedures, including public code review.
+
+What Yocto Security Team does when it receives a security vulnerability
+=======================================================================
+
+The YP Security Team team performs a quick analysis and would usually report
+the flaw to the upstream project. Normally the upstream project analyzes the
+problem. If they deem it a real security problem in their software, they
+develop and release a fix following their own security policy. They may want
+to include the original reporter in the loop. There is also sometimes some
+coordination for handling patches, backporting patches etc, or just
+understanding the problem or what caused it.
+
+The security policy of the upstream project might include a notification to
+Linux distributions or other important downstream projects in advance to
+discuss coordinated disclosure. These mailing lists are normally non-public.
+
+When the upstream project releases a version with the fix, they are responsible
+for contacting `Mitre <https://www.cve.org/>`__ to get a CVE number assigned and
+the CVE record published.
+
+If an upstream project does not respond quickly
+===============================================
+
+If an upstream project does not fix the problem in a reasonable time,
+the Yocto's Security Team will contact other interested parties (usually
+other distributions) in the community and together try to solve the
+vulnerability as quickly as possible.
+
+The Yocto Project Security team adheres to the 90 days disclosure policy
+by default. An increase of the embargo time is possible when necessary.
+
+Security Team Members
+=====================
+
+For secure communications, please send your messages encrypted using the GPG
+keys. Remember, message headers are not encrypted so do not include sensitive
+information in the subject line.
+
+-  Ross Burton: <ross [at] burtonini [dot] com> `Public key <https://keys.openpgp.org/search?q=ross%40burtonini.com>`__
+
+-  Michael Halstead: <mhalstead [at] linuxfoundation [dot] org>
+   `Public key <https://pgp.mit.edu/pks/lookup?op=vindex&search=0x3373170601861969>`__
+   or `Public key <https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xd1f2407285e571ed12a407a73373170601861969>`__
+
+-  Richard Purdie: <richard.purdie [at] linuxfoundation [dot] org> `Public key <https://keys.openpgp.org/search?q=richard.purdie%40linuxfoundation.org>`__
+
+-  Marta Rybczynska: <marta DOT rybczynska [at] syslinbit [dot] com> `Public key <https://keys.openpgp.org/search?q=marta.rybczynska@syslinbit.com>`__
+
+-  Steve Sakoman: <steve [at] sakoman [dot] com> `Public key <https://keys.openpgp.org/search?q=steve%40sakoman.com>`__

---
base-commit: 79e597aa45c4b171c8340d48803fa9987926851e
change-id: 20251204-reorg-security-section-e8f666183813


