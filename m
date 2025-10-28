Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314A3CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:58:08 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.9497.1761652685244352744
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 04:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=atpz2n63;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tmDmAo2gqV5tBzJaMg1T+dPHrQ3whQYt1hVFOkuojEg=; b=atpz2n63dofPWn89QNEeQL+PZt
	kRc3SErmM+NTnEGRS8f94pchX1CuOMnsJ4swOV+2tcm1zPjBECTJTrQE0K4+OvDdvIiA5Qy6/VnHU
	cTCMgcbVl9m7Vfmf1EaSnzOluSxSZ+QDjxH3Z0NGbJkHlB3KkSD/HcPodLOAz1UCrZ8FFpCr/MoM5
	Q3Nyl23RVVkakxqoGO3WhrU+nVfA4hLPvbNTN8KnG16EjxfWvUgzldqNpI2N8wps5ygGpqgadigFh
	S/d0doK5K323vs2j3NgDQRGX3ylkgT0B1wph5XSP3IHyDgaOWsTmAe6V/PJhxddNDKsx43oxfuPr3
	c9KRvfdQ==;
Received: from [147.129.179.166] (port=45228 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vDiKv-0000000CbQD-2Yq7
	for docs@lists.yoctoproject.org;
	Tue, 28 Oct 2025 07:58:03 -0400
Date: Tue, 28 Oct 2025 08:00:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual/layers.rst: document "bitbake-layers
 show-machines"
Message-ID: <cd97575f-dc17-df8f-7d9f-a253df64a09e@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Oct 2025 11:58:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7881


The "show-machines" subcommand is not mentioned in the docs; add it.

Signed-off-by: Robert P. J. Day <Crpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index cc7103ba6..e1c9aaeef 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -873,6 +873,8 @@ The following list describes the available commands:
    can replicate the directory structure and revisions of the layers in a current build.
    For more information, see ":ref:`dev-manual/layers:saving and restoring the layers setup`".

+-  ``show-machines``: Lists the machines available in the currently configured layers.
+
 Creating a General Layer Using the ``bitbake-layers`` Script
 ============================================================


