Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2D7CDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:48:39 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.23582.1697708913071964563
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 02:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bqz1WY+D;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3226cc3e324so6836033f8f.3
        for <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 02:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697708910; x=1698313710; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OiQM5pYI6iw+TGCouAZATCXQU7V5XbgR+7KrHGX0s1o=;
        b=bqz1WY+DsKSEiEigQgPeygkplwSPWfl/XIB7Rya3cneqrWVeEFYonzlmxEcpQVGN5o
         s9jYpMLpw7U1orx7r4+p7HaZFM0ka/D1u/dCveAtELdYKxqf0jX2yKm4X9UDvWvIIpxE
         iffytk6E8P9MfpWh5fG8mxL66v48N+ZJUOqCbvDrIknp80zOebS3zxuWkj3KxC92A3Mk
         sk3JW3u9cGI1X2yaRVeOXf0HpA82r8omwDQlcJI5dUeWTmm/2u2sROYhX33wr8bwNWg5
         FktMEFrYi6O7zGYMFnH0IqkFK1OpvV1ox9uTYKGwzRg0RPKpF29Hp7eoip9yaZlRQm0L
         ikpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697708910; x=1698313710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiQM5pYI6iw+TGCouAZATCXQU7V5XbgR+7KrHGX0s1o=;
        b=bFWyDNE76mZSasbcDh+uAZF9vINZmGCxJDXYo2kYF/IfH0P+oyjWmccH2u2wlZ4ddx
         UmTgifroMYes2J+qqejv5fOEK4EQJgNXzmCVBRfuIo0w6co/FnPOL0oiQw0xGFiIrWQc
         GzSRdFEFwhQFzRt7RuTfKvYUFIvyUfXmpdq+emQzekpbuIFVj/aNQqKtk/T2gy7eXXQN
         f+a0O5tS2GmYRiKBoCIQuzWCzgXNwkBxfua/p1qpwiSDqSNWJ5s/BEMkrlW7rndqBbpz
         byIPK0libzjBiPRy1OXDgwLFgJn+6Cp3G+u49fpbZ8W0+Oy2HThS0oebMTSadyZdSVDa
         pcng==
X-Gm-Message-State: AOJu0YyFffTp2YQJow5GyZPox06R9nk4L06XH6k86r11AH/QFTgtHMLz
	l/Zq9yAlMB0VBXsgMWSIH6blWkxQzk0=
X-Google-Smtp-Source: AGHT+IG/OPkRqEPbaiADMe1eKutE+z/+LwwY0FBqyecX+rhlKi2TooPG6NyCMlvT90fIAbVHe1mkvg==
X-Received: by 2002:a5d:534e:0:b0:319:85e2:6972 with SMTP id t14-20020a5d534e000000b0031985e26972mr1148437wrv.42.1697708910199;
        Thu, 19 Oct 2023 02:48:30 -0700 (PDT)
Received: from localhost.localdomain (91-161-217-16.subs.proxad.net. [91.161.217.16])
        by smtp.gmail.com with ESMTPSA id f10-20020a5d4dca000000b0032008f99216sm4049367wru.96.2023.10.19.02.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 02:48:29 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [RFC][PATCH] security-manual: initial version
Date: Thu, 19 Oct 2023 11:48:26 +0200
Message-Id: <20231019094826.9503-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 09:48:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4418

Add the initial version of the Security Manual with a
transcription of https://wiki.yoctoproject.org/wiki/Security_private_reporting

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 documentation/index.rst                       |  1 +
 .../security-manual/how-to-report.rst         | 98 +++++++++++++++++++
 documentation/security-manual/index.rst       | 26 +++++
 .../security-manual/security-team.rst         | 89 +++++++++++++++++
 4 files changed, 214 insertions(+)
 create mode 100644 documentation/security-manual/how-to-report.rst
 create mode 100644 documentation/security-manual/index.rst
 create mode 100644 documentation/security-manual/security-team.rst

diff --git a/documentation/index.rst b/documentation/index.rst
index 3fef1704a..ae8fb1534 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -35,6 +35,7 @@ Welcome to the Yocto Project Documentation
    Application Development and the Extensible SDK (eSDK) <sdk-manual/index>
    Toaster Manual <toaster-manual/index>
    Test Environment Manual <test-manual/index>
+   Security Manual <security-manual/index>
    bitbake
 
 .. toctree::
diff --git a/documentation/security-manual/how-to-report.rst b/documentation/security-manual/how-to-report.rst
new file mode 100644
index 000000000..6d8c0d1e9
--- /dev/null
+++ b/documentation/security-manual/how-to-report.rst
@@ -0,0 +1,98 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Reporting a potential security vulnerability
+********************************************
+
+How to report a potential security vulnerability?
+=================================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it using the
+:yocto_bugs:`Security Bugzilla </enter_bug.cgi?product=Security>`.
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to security AT yoctoproject DOT org, including as many details as
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
+========================================
+
+See the :yocto_wiki:`Stable release and LTS </Stable_Release_and_LTS>`
+wiki page for detailed info regarding the policies and maintenance of stable
+branches.
+
+The :yocto_wiki:`Releases page </Releases>` contains a list
+of all releases of the Yocto Project. Versions in grey are no longer actively
+maintained with security patches, but well-tested patches may still be accepted
+for them for significant issues.
+
+Security-reated discussions at the Yocto Project
+================================================
+
+We have set up two security-related mailing lists:
+
+  -  Public List yocto [dash] security [at] yoctoproject[dot] org
+
+    This is a public mailing list for anyone to subscribe to. This list is an
+    open list to discuss public security issues/patches and security-related
+    initiatives. For more information, including subscription information,
+    please see the yocto-security mailing list info page.
+
+  - Private List security [at] yoctoproject [dot] org
+
+    This is a private mailing list for reporting non-published potential
+    vulnerabilities. The list is monitored by the Yocto Project Security team.
+
+
+What you should do if you find a security vulnerability
+-------------------------------------------------------
+
+If you find a security flaw; a crash, an information leakage, or anything that
+can have a security impact if exploited in any Open Source software built or
+used by the Yocto Project, please report this to the Yocto Project Security
+Team. If you prefer to contact the upstream project directly, please send a
+copy to the security team at the Yocto Project as well. If you believe this is
+highly sensitive information, please report the vulnerability in a secure way,
+i.e. encrypt the email and send it to the private list. This ensures that
+the exploit is not leaked and exploited before a response/fix has been generated.
+
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
diff --git a/documentation/security-manual/index.rst b/documentation/security-manual/index.rst
new file mode 100644
index 000000000..78a13fa6a
--- /dev/null
+++ b/documentation/security-manual/index.rst
@@ -0,0 +1,26 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+==============================================
+Yocto Project and OpenEmbedded Security Manual
+==============================================
+
+The Yocto Project and OpenEmbedded are open-source, community-based projects
+used in numerous products. They assemble multiple other open-source projects,
+and need to handle security issues and practices both internal (in the code
+maintained by both projects), and external (maintained by otehr projects and
+organizations).
+
+This manual assembles security-related information concerning the whole
+ecosystem. It includes information on reporting a potential security issue,
+the operation of the YP Security team and how to contribute in the
+related code. It is written to be useful for both security researchers and
+YP developers.
+
+.. toctree::
+   :caption: Table of Contents
+   :numbered:
+
+   how-to-report
+   security-team
+
+.. include:: /boilerplate.rst
diff --git a/documentation/security-manual/security-team.rst b/documentation/security-manual/security-team.rst
new file mode 100644
index 000000000..3d23f8636
--- /dev/null
+++ b/documentation/security-manual/security-team.rst
@@ -0,0 +1,89 @@
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
+members are needed, the YP TSC asks for nominations by public channels including
+a nomination deadline. Self-nominations are possible. When the limit time is
+reached, the YP TSC posts the list of candidates for the comments of project
+participants and developers. Comments may be sent publicly or privately to the
+YP and OE TSCs. The candidates are approved by both YP TSC and OE TSC and the
+final list of the team members is announced publicly. The aim is to have people
+representing technical leadership, security knowledge and infrastructure present
+with enough people to provide backup/coverage but keep the notification list
+small enough to minimise information risk and maintain trust.
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
+The security policy of the upstream project might include a notification to
+Linux distributions or other important downstream projects in advance to discuss
+coordinated disclosure. These mailing lists are generally non-public. The YP
+Security Team participates in the discussion as needed. They might also
+include the YP maintainer of the affected package.
+
+When the upstream project releases a version with the fix, they are responsible
+for contacting `Mitre <https://www.cve.org/>`__ to get a CVE number assigned
+and the CVE record published.
+
+When the fix is publicly available, the YP security team member or the
+package maintainer sends patches against the YP code base, following usual
+procedures, including public code review.
+
+Current Security Team members
+=============================
+
+For secure communications, please send your messages encrypted using the GPG
+keys. Remember, message headers are not encrypted so do not include sensitive
+information in the subject line.
+
+  -  Ross Burton <ross@burtonini.com> `Public key <https://keys.openpgp.org/search?q=ross%40burtonini.com>`__
+
+  -  Michael Halstead <mhalstead [at] linuxfoundation [dot] org>
+     `Public key <https://pgp.mit.edu/pks/lookup?op=vindex&search=0x3373170601861969>`__
+     or `Public key <https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xd1f2407285e571ed12a407a73373170601861969>`__
+
+  -  Richard Purdie <richard.purdie@linuxfoundation.org> `Public key <https://keys.openpgp.org/search?q=richard.purdie%40linuxfoundation.org>`__
+
+  -  Marta Rybczynska <marta DOT rybczynska [at] syslinbit [dot] com> `Public key <https://keys.openpgp.org/search?q=marta.rybczynska@syslinbit.com>`__
+
+  -  Steve Sakoman <steve [at] sakoman [dot] com> Public key
+
-- 
2.39.2


