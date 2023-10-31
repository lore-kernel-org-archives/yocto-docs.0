Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34920C4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 09:39:10 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.182218.1698745143482910546
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 02:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UB+z7FNw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B04C20011;
	Tue, 31 Oct 2023 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698745142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnZYbeMcah6criw+Stt2hnm6oWntPh3xzBEGjGrhsSU=;
	b=UB+z7FNw7I4hbpFSdW/QNkQ5PL16jTT1I38pMTV43+03jSa/J56i5wKeT6CPqRw5TOqX3X
	nwvWoe7LS+KL4dOFOAemtBc2ikZHCQcF2t7pEPxRYPezFA0/N7GD9CB0hbUQjkq/3oXaHp
	8Z5KRBT0eIV5jT16bNRGT3+JX+d15BSRr3pZVpRvq95jvYbYnyCscizKikoC99aZRaBQBv
	uecZtOc1X8Z9NPyhDwe4jGJBXxolQJbbZ65NGdAm4cacb7RJ9FC6C+h53bEr2OFD02xEhr
	oC1vVwBUd3/CnzsPDvUDooqXLLgcvBIvp2HTwkDX84B2U7D5vNzRWzherozsXw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [mickledore][PATCH 2/3] dev-manual: add security team processes
Date: Tue, 31 Oct 2023 10:38:53 +0100
Message-Id: <20231031093854.1792471-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031093854.1792471-1-michael.opdenacker@bootlin.com>
References: <20231031093854.1792471-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 09:39:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4536

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Marta Rybczynska <rybczynska@gmail.com>

Add the initial version of the section on vulnerability reports,
operations of the Security Team with a
transcription of https://wiki.yoctoproject.org/wiki/Security_private_reporting

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/index.rst            |   1 +
 .../dev-manual/security-subjects.rst          | 189 ++++++++++++++++++
 2 files changed, 190 insertions(+)
 create mode 100644 documentation/dev-manual/security-subjects.rst

diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
index 3618e51c8d..e731a70476 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -44,6 +44,7 @@ Yocto Project Development Tasks Manual
    runtime-testing
    debugging
    licenses
+   security-subjects
    vulnerabilities
    sbom
    error-reporting-tool
diff --git a/documentation/dev-manual/security-subjects.rst b/documentation/dev-manual/security-subjects.rst
new file mode 100644
index 0000000000..1b02b6a9e9
--- /dev/null
+++ b/documentation/dev-manual/security-subjects.rst
@@ -0,0 +1,189 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Dealing with Vulnerability Reports
+**********************************
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
+The :yocto_wiki:`Releases page </Releases>` contains a list
+of all releases of the Yocto Project. Versions in gray are no longer actively
+maintained with security patches, but well-tested patches may still be accepted
+for them for significant issues.
+
+Security-related discussions at the Yocto Project
+-------------------------------------------------
+
+We have set up two security-related mailing lists:
+
+  -  Public List: yocto [dash] security [at] yoctoproject[dot] org
+
+    This is a public mailing list for anyone to subscribe to. This list is an
+    open list to discuss public security issues/patches and security-related
+    initiatives. For more information, including subscription information,
+    please see the  :yocto_lists:`yocto-security mailing list info page </g/yocto-security>`.
+
+  - Private List: security [at] yoctoproject [dot] org
+
+    This is a private mailing list for reporting non-published potential
+    vulnerabilities. The list is monitored by the Yocto Project Security team.
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
+
+Security team
+=============
+
+The Yocto Project/OpenEmbedded security team coordinates the work on security
+subjects in the project. All general discussion takes place publicly. The
+Security Team only uses confidential communication tools to deal with private
+vulnerability reports before they are released.
+
+Security team appointment
+-------------------------
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
+------------------------
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
+-----------------------------------------------------------------------
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
+-----------------------------------------------
+
+If an upstream project does not fix the problem in a reasonable time,
+the Yocto's Security Team will contact other interested parties (usually
+other distributions) in the community and together try to solve the
+vulnerability as quickly as possible.
+
+The Yocto Project Security team adheres to the 90 days disclosure policy
+by default. An increase of the embargo time is possible when necessary.
+
+Current Security Team members
+-----------------------------
+
+For secure communications, please send your messages encrypted using the GPG
+keys. Remember, message headers are not encrypted so do not include sensitive
+information in the subject line.
+
+  -  Ross Burton: <ross@burtonini.com> `Public key <https://keys.openpgp.org/search?q=ross%40burtonini.com>`__
+
+  -  Michael Halstead: <mhalstead [at] linuxfoundation [dot] org>
+     `Public key <https://pgp.mit.edu/pks/lookup?op=vindex&search=0x3373170601861969>`__
+     or `Public key <https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xd1f2407285e571ed12a407a73373170601861969>`__
+
+  -  Richard Purdie: <richard.purdie@linuxfoundation.org> `Public key <https://keys.openpgp.org/search?q=richard.purdie%40linuxfoundation.org>`__
+
+  -  Marta Rybczynska: <marta DOT rybczynska [at] syslinbit [dot] com> `Public key <https://keys.openpgp.org/search?q=marta.rybczynska@syslinbit.com>`__
+
+  -  Steve Sakoman: <steve [at] sakoman [dot] com> `Public key <https://keys.openpgp.org/search?q=steve%40sakoman.com>`__
-- 
2.34.1


