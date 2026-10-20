Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2848.1792485847878062188
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Oct 2026 01:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=XSB3MO+8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20261020084403f5d5e9cf7600020763-8gie2u@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261020084403f5d5e9cf7600020763
        for <docs@lists.yoctoproject.org>;
        Tue, 20 Oct 2026 10:44:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=e3kDlThStyKz2i++hJ1HEWsBRnOjV5zewR4MOmjffq0=;
 b=XSB3MO+8QP3g57iGUNG4xVmdK/OT0jgyLStYbfEPRoT87eIyQ2WGqe0kN/wnY2oci6L47e
 C/0MQBd1KnZk2JKCANlW9utbomjQckauS44hQSUzmfpR19cA48feGqXmEH+py1gBWFMBGIJ2
 6fZdZlxS5D4GChlPW3jd4/H2YFjB+nftjZHem/Ap5+snBRU7w73akZnDkOYyEMGkiL4nUZo4
 afA87VrlCSOnTmeauD8O+StQfShb5NfORBuLjbfb5y2qwB375f+9a0se0WKi6c5095fFkVUf
 ILcJjFgofyzcNoLKqpYEbsTt3ZossJGEbSlJJmSrMiXjgA6cW3pDlbSQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Trevor Woerner <twoerner@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v4 1/4] ref-manual: put the ARCHIVER_MODE comments on their own lines
Date: Tue, 20 Oct 2026 10:43:37 +0200
Message-ID: <20261020084359.354498-2-adrian.freihofer@siemens.com>
In-Reply-To: <20261020084359.354498-1-adrian.freihofer@siemens.com>
References: <20261020084359.354498-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 20 Oct 2026 08:44:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10695
Content-Type: text/plain; charset="utf-8"

From: Trevor Woerner <twoerner@gmail.com>

BitBake has no inline comments. A "#" after a value is not stripped and
does not end the statement: the parser simply fails to match the line, so
each of these varflag examples would be rejected outright if copied into
a configuration file.

Move each explanation to the line above the setting it describes, which
parses and reads the same.

AI-Generated: codex/claude-opus 5 (xhigh)
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 27 +++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8a9bd9075..5339721f4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -158,13 +158,26 @@ system and gives an overview of their function and contents.
       original source, configured source, and so forth by employing the
       following variable flags (varflags)::
 
-         ARCHIVER_MODE[src] = "original"                   # Uses original (unpacked) source files.
-         ARCHIVER_MODE[src] = "patched"                    # Uses patched source files. This is the default.
-         ARCHIVER_MODE[src] = "configured"                 # Uses configured source files.
-         ARCHIVER_MODE[diff] = "1"                         # Uses patches between do_unpack and do_patch.
-         ARCHIVER_MODE[diff-exclude] ?= "<file> <file> ..."    # Lists files and directories to exclude from diff.
-         ARCHIVER_MODE[dumpdata] = "1"                     # Uses environment data.
-         ARCHIVER_MODE[recipe] = "1"                       # Uses recipe and include files.
+         # Uses original (unpacked) source files.
+         ARCHIVER_MODE[src] = "original"
+
+         # Uses patched source files. This is the default.
+         ARCHIVER_MODE[src] = "patched"
+
+         # Uses configured source files.
+         ARCHIVER_MODE[src] = "configured"
+
+         # Uses patches between do_unpack and do_patch.
+         ARCHIVER_MODE[diff] = "1"
+
+         # Lists files and directories to exclude from diff.
+         ARCHIVER_MODE[diff-exclude] ?= "<file> <file> ..."
+
+         # Uses environment data.
+         ARCHIVER_MODE[dumpdata] = "1"
+
+         # Uses recipe and include files.
+         ARCHIVER_MODE[recipe] = "1"
 
       For information on how the variable works, see the
       ``meta/classes/archiver.bbclass`` file in :term:`OpenEmbedded-Core
-- 
2.56.0

