Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDD0CCFA1F
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 11:58:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by mx.groups.io with SMTP id smtpd.web10.40681.1727351911479545441
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 04:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=T0/CWLj/;
 spf=pass (domain: intel.com, ip: 192.198.163.19, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727351911; x=1758887911;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EGyOwscy4Suou71jQ2pvBXXQadJjxoqwzTajQhHIa9Y=;
  b=T0/CWLj//QcOwQVUPi6Nlky4MczfvL7oZXdBos7a7NEULx2SeHFeODoj
   C3E6f79FU5g59acfwTL3D+qnVjsPAFc98DQhgH5IMijHCGSg00vEtR1aD
   0A+9U4dONQu7HXNzvPZeZhxQMdHEtorGvMsMWv3RqTablDM9B3q4MTTYV
   QPonFFcmnJYtu9tsTcOc8LJxKvLOrqw305ve5PEGmVuTqLWk2GsY9kYDm
   eeHUiI3QifmfIb8VnC2aVIwd8rAkdH/rVJ2PB0D1s1BRB+RofUCi5KZIu
   Eg/TgVSL2PkwfHJnfnngWQkzxhDmEKT2xMMOrEyVRg2lPxAYvZ9gBk17c
   g==;
X-CSE-ConnectionGUID: z1cbxvSDRGKsdSfZK3+Q4A==
X-CSE-MsgGUID: SqJ/Vhy/S0CPRkGNo0NJeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="25947430"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="25947430"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 04:58:30 -0700
X-CSE-ConnectionGUID: 7vKEldQ6RmGHJdI3/BRuIg==
X-CSE-MsgGUID: XUy//i3mSMGoGXrNdQR9Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="76207274"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by fmviesa003.fm.intel.com with ESMTP; 26 Sep 2024 04:58:30 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 0/1] release-notes-5.1: update for several section
Date: Thu, 26 Sep 2024 19:57:51 +0800
Message-Id: <20240926115752.2412800-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Sep 2024 11:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5372

From: Lee Chee Yang <chee.yang.lee@intel.com>

This is on top of master-next commit
3f4e86cf0bf3d7eef651c54358b601374f4d37e7
https://git.yoctoproject.org/yocto-docs/commit/?h=contrib/abelloni/master-next&id=3f4e86cf0bf3d7eef651c54358b601374f4d37e7


Lee Chee Yang (1):
  release-notes-5.1: update for several section

 .../migration-guides/release-notes-5.1.rst    | 304 +++++++++++++++++-
 1 file changed, 301 insertions(+), 3 deletions(-)

-- 
2.34.1


