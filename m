Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E74CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 19:45:29 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28510.1780515928416367747
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 12:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=B5bg43pl;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=IBLmFbNh;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 6F823EC00A4;
	Wed,  3 Jun 2026 15:45:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 03 Jun 2026 15:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1780515927; x=1780602327; bh=mH
	iD+oiJqjcVGP6WIMNQkeChw8c+ULugZfI+4JCBZPE=; b=B5bg43plvRiQ64XA6c
	C2iKsuk/8vKboWdD7mrdHSsLWlTq2h9kb6NGaoLrIxtSezopnDd8+Dg6vzsAEwHM
	81kpblh/Cy9wgRT3IRSHg3XAXqo5gQSuRDGdGYJWrG84UNeyBjcHaEe5GkUtiJk/
	NphIl2n5r5plOAqLeVbxzqDvI+uw2/vxsMaaoqZocJD8FprZjL7yQL4L4gMublcV
	n/Mj7RfRM4SznikhFPH1r0krsbmWIKTuNvauGSE+Gt5p2tU9IrD2rhOBiyoRxnji
	Pg/JgR50ui0LOypa5ZX6zCp+yB/cnCzQbTaxYc+hCNPynihyTHwtrn3KGEREwj2b
	OrMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1780515927; x=1780602327; bh=mHiD+oiJqjcVGP6WIMNQkeChw8c+
	ULugZfI+4JCBZPE=; b=IBLmFbNhDuLWJsttfhIIsgl9fwBL/FSJCD1SjJFgzNdi
	o2bb+NSHQ7WQd77KChczwnD73YqmEPB7T7sAeUhIgrCD5aNTGGgos7YiFhrUWq4R
	UsjSy3HGkGUJk6nwYJ89o80/cJo9VM8L4vxfIAqlRlwSMhMgQBXzTgkF++WPK5Ss
	HEMBxr8HaZjoN7y9ezwiv6HrjdJeMHD57XXY5HWKkJCLGO5Y7neEsTqLZac+aGQs
	xEy4d4UDkgO/KIhh8XCowEd99YTM5yzEc+mo1qaUCnVTaD/9sNfbEOuoLRjmzTVO
	JBTvOWUctqAqlxt0a4/e/t/1publCb1u0sFZdz1rvQ==
X-ME-Sender: <xms:V4Qgag9r0Wf2Z0PkGEHDQP8ZRsjoOSZm-lAi5J-WJm2lC3k7yiVrTQ>
    <xme:V4QgagIHAMDGGfY57CS2WnIUFdZq1xlr5yeN2e1rp5liuEd-Ba9ai2DuXcZhF0NzB
    Sw7YYocGXYAOCMGzrTzZZBTQ7cY7e1Quro6CGCVSd1lT18_3RtHATkF>
X-ME-Received: <xmr:V4QgajbQpCywkjBPTEukGhbtmc6swQGTjylutYUUg3rYgltH8X-lZqcDAeU9HdeIZ2HN6ZPraMgHViTrZhd04qrc8HR9V5E>
X-ME-Proxy-Cause: dmFkZTEDUOTt9cf6va4dpiZtFNB/za+aAu1XLqpTBvUGrUVFj6HCWEuwy3qrMLUWmQ8onH
    QUimH7RhbiTz4Vc72X8M1NwM+Itq2NNtL196jliCTrVtCsUN7QNmNaP2Drpr/BJ64XjsQE
    St7ydIPGeNifC4VeqAQMSx7VBnaqOzP1Q1Fj8gptLu1R9AxQeHLgR5iMkbAa8X0fM18xuZ
    NTiMKweE8uY4odTPbfp2m+zBKSsr0kAO0oocS95wPkpMiyeBCDqL9TgV0Myau0r98K5mJR
    gx4+pzYnaEJ2cGATwdOhQWzBAKXDXQXOL47d2Wl6IYdwrFjZnN9ql9ciWMz7ieZ709a1O3
    NTuP5INLSogMwuMK6i5HcX7QP9O+H2ervp0JlGPsj4r191lpLkZwxiyZ4ucs367rvNFuWt
    tLMmougGltko1o/aMpoz30fX+zvN2GXIHs8RkUitu8e02uasw+KiITUkluKIVdhP5gglmT
    yjfd8rYoffktkW/ZBbSEB+McacYySUSvjc4Ra2E43zulNPqy8/+Q5/GnykxKLTFEFsQ9Af
    aLvQPzPlcFfUiqL8g+KKq9e2CVhex2z0DuhQ/9g32Ph4O013kydppgYEN/E88PFjWVx+BV
    h5mbuUSfF8bzi3h17DRX9FaJf6GbjbNvtBz3+SX6F9R/axdzpmg7KOOSSEuw
X-ME-Proxy: <xmx:V4QgaqKuz8MrCR8b7-v4A5exrMgRFR-gMtfrJaEtRIRzb1nykgXRAw>
    <xmx:V4QgapBiDNqhgtzcAmvmhgSdGcn4KI875BRt0Q95Jvh6Yytt05GwTw>
    <xmx:V4QganrYJL-K-TR0987m5Xt21o6Hq3F0jVPPbu4rx4ODLC1fG-x9fg>
    <xmx:V4QgasjReEcZMOgzvcGj1Qvon3LDJXF4KQJtJUFKiyZRR_yluGLhuA>
    <xmx:V4Qgaqz4RZFeNgcotDXd8sS1CZ7NolTFd-CbegoYjQiEuoX4qU4Mh17C>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 15:45:26 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH v2 0/3] Security team documentation updates
Date: Wed, 03 Jun 2026 20:45:16 +0100
Message-Id: <20260603-sec-team-v2-0-ee7d2016fbf4@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEyEIGoC/22NwQ7CIBAFf6XZsxgKKRZP/ofpAejWorFtWCSah
 n+X1qvHSebNW4EweCQ4VysETJ78PBUQhwrcaKYbMt8XBsGF4opLRuhYRPNktZNac42ylRaKvgQ
 c/HtPXbsf08ve0cVtvxmjpziHz/6V6s37k00142wYrMBWq6Y9NZfFmvDAcOwxQZdz/gLpt366t
 AAAAA==
X-Change-ID: 20260603-sec-team-1c39909e383b
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>, 
 Marta Rybczynska <marta.rybczynska@ygreky.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=zqTHhIm/FfkM+s1t3rxukt4KqhxdvwEJLXEgozfrqCM=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQptISx3n2bOdtbJn3Zt5U1Ts1yWYcKX73aLTLzuIVGy
 PvFOw4nd5SyMIhxMciKKbJs7vl6/2mvI29GyC0FmDmsTCBDGLg4BWAibhWMDP+Yr9a7Mt44eSNx
 u6GXUtQP9qU2MyX9Ls4xzSv6e1vJ6iEjQ+spHxnlvrXSB5cXPnt8aofJ31D2rVKVm2ecD3atUj8
 5kREA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 19:45:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9570

- Add myself to the security team in place of Steve Sakoman.

- Small tidy up and update of how we describe the security team
  operations.

- Migrate the documentation of how we handle multi-project embargoes
  from the wiki.

I've based this on top of v2 of Marta's patch to update her email
address [1] so that it is easier to apply.

[1]: https://lore.kernel.org/yocto-docs/20260603185843.44152-1-marta.rybczynska@ygreky.com/

---
Changes in v2:
- Rebase on v2 of Marta's patch.
- Drop "If an upstream project does not respond quickly" to a lower
  heading level.
- Migrate multi-project embargo docs.

---
Paul Barker (3):
      security-team: Update membership list
      security-team: Tidy and update section on security team operations
      security-team: Add section on multi-project embargoes

 documentation/security-reference/security-team.rst | 50 ++++++++++++++--------
 1 file changed, 31 insertions(+), 19 deletions(-)
---
base-commit: f57c4bb14c40fcd187f53042fd06d8cbef8f4e22
change-id: 20260603-sec-team-1c39909e383b

Best regards,
--  
Paul Barker


