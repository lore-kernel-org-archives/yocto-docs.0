Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5D81061B3E
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 12:29:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19204.1774960165416088579
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 05:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CTLdim1l;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 122021E5E;
	Tue, 31 Mar 2026 05:29:19 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BEB3F3F7D8;
	Tue, 31 Mar 2026 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774960164; bh=dtO/n/nwx37JmBO5OX53fwzpifntXgoBKFqqOpCfXdo=;
	h=From:To:Subject:Date:From;
	b=CTLdim1lCAMjMZIEKtAkcoYk7VzHV6OyeIq4tdgDcDmsIPPgmihZhNazmRQMx+ro+
	 s15qavpVqoBRVH8IhAClFDsUWdaTfr5f2s3tpPb0wLfZuLW3rQPs/utlZwla5q/ilz
	 B73gLZBU+gNMiCca9IikA6XeA7V1nub+7/6yHfwY=
From: Jon Mason <jon.mason@arm.com>
To: docs@lists.yoctoproject.org
Subject: [RFC PATCH 0/1] ref-manual: add boot architecture documentation
Date: Tue, 31 Mar 2026 08:29:22 -0400
Message-ID: <20260331122924.54516-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Mar 2026 12:29:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9151

This RFC adds documentation to the Yocto Project for the hardware boot fl=
ow, the software components involved in that flow, and the proposed varia=
bles used to prevent invalid combinations of mutually exclusive boot soft=
ware components.

This documentation is intended to provide common background and context i=
n the Yocto Project for the associated software selections and variable u=
sage.

This RFC is documentation-only so I can get feedback on the description, =
terminology, and overall approach before sending the full implementation.=
 =C2=A0I plan to send a full patch series that includes
this documentation along with the corresponding recipe and variable chang=
es for the relevant software components after addressing any feedback.

Comments on the content, naming, and placement would be appreciated.

Thanks,
Jon

Jon Mason (1):
  ref-manual: add boot architecture documentation

 .../ref-manual/boot-architecture.rst          | 361 ++++++++++++++++++
 documentation/ref-manual/index.rst            |   1 +
 2 files changed, 362 insertions(+)
 create mode 100644 documentation/ref-manual/boot-architecture.rst

--=20
2.50.1 (Apple Git-155)


