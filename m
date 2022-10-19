Return-Path: <ito@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC0CC4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 17:14:43 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web12.109.1666199680382258221
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 10:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: ito@lineo.co.jp)
Received: from [192.168.3.12] (softbank126088165209.bbtec.net [126.88.165.209])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id 299148017D93D;
	Thu, 20 Oct 2022 02:14:38 +0900 (JST)
Message-ID: <fc574ad0-ee8d-1e51-6b14-068d5249142a@lineo.co.jp>
Date: Thu, 20 Oct 2022 02:14:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [docs][PATCH v2] migration-guides/release-notes-4.1.rst: remove
 bitbake-layers subcommand argument
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
References: <1ea1ac6e-315c-45d2-61c9-05197154f720@lineo.co.jp>
 <d9e810d9-d51b-51fe-e7b0-08d302dd58ec@bootlin.com>
From: Takayasu Ito <ito@lineo.co.jp>
In-Reply-To: <d9e810d9-d51b-51fe-e7b0-08d302dd58ec@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Oct 2022 17:14:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3378

Hi Michael

On 2022/10/20 1:26, Michael Opdenacker wrote:
> Hi,
>=20
> On 10/19/22 18:17, ito@lineo.co.jp wrote:
>> Hi all
>>
>> - remove bitbake-layers subcommand argument
>> ---
>> =C2=A0documentation/migration-guides/release-notes-4.1.rst | 2 +-
>> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
>=20
> Thank you very much for the patch!
> However, you're missing a "Signed-off-by" field in your patch. Make sur=
e you produce your commit with "git commit -s".
>=20
> You should also try to run the following command to get your full name =
as commit author when I accept your patch:
> git config --global sendemail.from "ito@lineo.co.jp"
>=20
> Could you send a new version after doing this, please?
> Thanks again
> Cheers
> Michael.
>=20


I forgot to specify the "-s" option.

--=20


Signed-off-by: Takayasu Ito <ito@lineo.co.jp>
---
  documentation/migration-guides/release-notes-4.1.rst | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.1.rst b/docum=
entation/migration-guides/release-notes-4.1.rst
index 0c552bf1a..a2d4b3d6c 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -18,7 +18,7 @@ New Features / Enhancements in 4.1

    - New ``scripts/oe-setup-layers`` standalone script to restore the la=
yer
      configuration from a json file
-  - New ``bitbake-layers create-layers-setup destdir`` command to save t=
he
+  - New ``bitbake-layers create-layers-setup`` command to save the
      layer configuration to a json file
    - New ``bitbake-layers save-build-conf`` command to save the active b=
uild
      configuration as a template into a layer



