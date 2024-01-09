Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34550C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 11:38:30 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.51])
 by mx.groups.io with SMTP id smtpd.web10.14644.1704800300571651549
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jan 2024 03:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=4hhVTByZ;
 spf=pass (domain: navimatix.de, ip: 40.107.15.51, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQFxZJ728uVZ067aTaz+My7/r+JW6hDFNAXrR3CDvU6whZqqt/R78HJNaE1l3krV4kIDoa5DgalbgImwRuXvrIpg8i5G+NKLHzo4gNFiayYMqdOjtHr1m8dsH17TIVhsGEB9cHhMNrLCp61qpFyAIyEtWsI6WBP2nlyOQCdCnBb98dPlwXonyENmSTmzqOl+f3Rr3Y+SLyBPIV5/mGHXJ0zKx1adN7SGGeq5IPtUhJKXRyhPPD0idp2e/UphZRm0WpkvsTsqRqmsQDii3K2ZMGpoafaJsXUx0Yrhxy0v6iX+SnTVX5+UqeRTfN5xydjPn4evIY+1hb+6DL1Hmfk6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFN17T7AdkKlweUlL4cwl9t1cWPvxfdPh3ze2ftVWPs=;
 b=AKpfliwM5udaPqlraPx0nrsCdOtGq8bnUn9noxRimhnmX2VjgBdXke7410AcKf9timyVVua2QTPbadbNTkbSTPpiMT7OkZxa8DF0wsgKvbfn5P+ZuC91MVkF76cH8R5YSDmYczp+UuU19bIi5uGztNU7xjrUMbpBprwZIkYQiCkf1nTed0U6tAR6+g8hsXjC2DeOmywAQZt6gUKcsohtehNg7JZdWVeYfrLFZHBmd0rP1x6k9llTciFSBkkaAHQfsFJ+PBpA5/K/TUDFpfz2BYmOI0qxZnZsbaVcyMUn/0I0n1vxJLgxx2hsTzVVdAe3hDnVLQpGhyiMFbaDBpIthg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFN17T7AdkKlweUlL4cwl9t1cWPvxfdPh3ze2ftVWPs=;
 b=4hhVTByZqM6/FQOtp3/TXIt9VL3p1uv9No3ulAvBpQH/b68s//IjT9ozqXmphBysXwbrd1hCeLDBwbkjEyOWcbdhaeqg6wE1++LiUpn4GrdfbCzQIm2AtBigJqdhyIt0BwoD2L4xrByYkFwu0BFZtRKk5WtvoScemDJqbjqjG8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22) by DBBPR01MB7642.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1e0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 11:38:17 +0000
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f]) by DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f%5]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 11:38:16 +0000
Message-ID: <3369b704-5713-43e7-b277-d2b5ef16dce5@navimatix.de>
Date: Tue, 9 Jan 2024 12:38:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] documentation: Add UBOOT_BINARY, extend
 UBOOT_CONFIG
Content-Language: en-US, de-DE
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: docs@lists.yoctoproject.org
References: <41ed326b9aa4b74ee618378d54a2494f7d035a3f.1703845757.git.joerg.sommer@navimatix.de>
 <0604e406-49f9-46f5-9622-e17a7271e253@bootlin.com>
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
In-Reply-To: <0604e406-49f9-46f5-9622-e17a7271e253@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0410.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::8) To DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8592:EE_|DBBPR01MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: b80abbe9-6c6a-49c0-ccf1-08dc110778b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6j8xb6owlAC12aSIZV2UsFmGgS+3uoStiMBr4x/V0Q8T7Yz2cuVb5eR3DRsGeB1jM45QJAJoZZC4T68UIIHkl3BmSJeCVkcjWaRK9QucXh3+BcymhS1RtJ0R25x8Rxd8ipZlUFqbU7RXgFsYZzzj0mUrKtgOHkSPBvvRP0/AO+mEJ0nWNTvX8htwXOL7gyCbFezquzCKUK2mBkk+7dl+jvlb4hUMvQTZGzyVtaIatfmF476usJBwespu/gf8GqvJ7ofpso2amh0BtybVK4OIU8sTgZxuf/Ip7CTx6ga20eWRlUYiKd82aX6m8Vig6NL8OM+8OVJDdx9ILIlEdrqC2Jg9qLkfKJAEHweUYkQne+dzo1TEt3ubwUDH9cBH1zUfQI02iQEnTis9GAkm+pgRx+RXn5uCE17LHDdqf0rVB2YC067tC5272FVojkX44KAf8hGLRbBphO+b4+IxqqXaukCiGT08m1GkFOV8I9AIqV53bJI72gxLErtEq36NV2781doAlst3o4a9PYdlIpjBqHsGp2ocWrCgiLd+imNMS8ANNIvoROwslTiGiALsSoCkW15Zwu9ep2eo6qIVgnycBRwurNgXAiDXjKZiOA4Qy8m8A+9azj0nLVwI5fqxsS8H
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8592.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39840400004)(376002)(136003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(66574015)(26005)(83380400001)(6512007)(6506007)(53546011)(2616005)(5660300002)(4744005)(4326008)(41300700001)(2906002)(6486002)(478600001)(66476007)(316002)(8676002)(66556008)(8936002)(6916009)(66946007)(36756003)(31696002)(86362001)(38100700002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7TYfXpG/YBo21Qwr2tb6Jy1GdNnikDttWmzj9gj3ZOQiAmMmobs1CN1nWPoU?=
 =?us-ascii?Q?qYhJgPwZcg+qhNk5wSVTcI2uDIu9b5WeCyrC4wskeBkucXCABvN/8wbeBu7Z?=
 =?us-ascii?Q?k9NY07xRMsPKhgnT8G38ei/kdzE8+0G/PdMsHVe9i8tDqvZy0npOJ5n9jqeb?=
 =?us-ascii?Q?LGDDEbRv8XbEtWZKbaKzLlktmgBnFX/Z8MH9J3EJJtZsKwyrRAT2qRAWVcEs?=
 =?us-ascii?Q?SOxA3/QN/sUYqYFsiL46OWPrcvCRe1uaD4ng2H5PkvVu0SXAfd12A7lQYl31?=
 =?us-ascii?Q?kqXRnHz69xwN8Pqt4qwPPG+jhUoTWo1vzSF0Hd6hstJm8H3b2ksC23bcrKwn?=
 =?us-ascii?Q?UepSjEqa0oTcjma4P/oJ65dvzStEMSpgP1mGtdZmximPlolY34UPQWdzYpoq?=
 =?us-ascii?Q?XG5xsUohQYxiJ/wqvknQ3Fq7WWBqKPffS7AOQRQXkBABrrZQ1GqhVTv68A0s?=
 =?us-ascii?Q?gXGgKoTF6F0AP3wqs1sCNRcUKcHgCs9a8zg+kRXRc2sX1hP7o2wuZOlYbWv4?=
 =?us-ascii?Q?6mVnia1iHWqtOS35ruszBQSpbNhZvy2eATVYdv7i8YxF+yoINJ5HAuShrpmq?=
 =?us-ascii?Q?B0AOC3jLeUY0wOuyEeUXN5wOWhQ8WyUgzRM0QANSc7iJeCvxMpIS6FkApw5V?=
 =?us-ascii?Q?YMoknAl/8rVl9U3hG8/HTimZ4/0hzjRL16E4u3wkwavtQYtdybUcQ1GpDo2j?=
 =?us-ascii?Q?Raktn0f4BYVH4URuGgYnN72aiPRdsuuhGer136wSgMgHnevYvs9+H/kM6Go8?=
 =?us-ascii?Q?jtQwOpA8JeevnNmDzQKpdue8Js4l0wuufv0agjqHrnTbT7N3m9wLXkwHV7N8?=
 =?us-ascii?Q?vNwF29e836054lULI9G26K1zv/9WL0rkmLzpRUEhzF3lRKDNvwuGVakvXi4V?=
 =?us-ascii?Q?4dTJg6craXT214+ZGDo9iPVDqiJ26+rO4P123N4RVLVjZ1trB8j7yAEo1AOO?=
 =?us-ascii?Q?76pZWMJflnmPEeQiTxJ7Zunmk5aNzE2N06/OA7Q9KUHAor6omt1Nn8Uc40uW?=
 =?us-ascii?Q?tz48ov7Aq8QFH2CHsYCR/drGuXMBxlesZdG0m2qxE+AIiNrdGqeGoJuS1MWt?=
 =?us-ascii?Q?txiL43fH5VphJN04rbSv5gDD+4Rv7i19QJHkc+XnymgSAGKXeDN1xI98UMcm?=
 =?us-ascii?Q?K12I7Ngn8vlIxc5dBxLKv25tmlVDvgeRdTOLcE79h2w4x+rGt/wuJeIS5/Nd?=
 =?us-ascii?Q?mGhG8x49rBALkHCriz1lv2X3Wp6EBE03PDnh4pSj0bfJSlP6oM2kL4f3f0Nd?=
 =?us-ascii?Q?/OuaROWrbaYzOYKQQwZdgV70p4iWO0+x0VuJkJpsIi2XOCHTik52yu0LlsBf?=
 =?us-ascii?Q?gD+2wl6cnY1U0hc6qW0hZBFTaUtg3SaP1mS3EoZZ9UWPg+NJDRpI+WPkMsBE?=
 =?us-ascii?Q?22gngYsCIn5e9qbuuS93DsHqWdH9xVvBKeVW8pLjxjZ/1NeIW2LhHHA9B51w?=
 =?us-ascii?Q?8uxQ5XnFDmSXBIUc7Xp2jNz1K1NajJGKfQvp//Mw3x36RR8gIH9OjNV02uMr?=
 =?us-ascii?Q?wU8j+0PPTc+mu7sAHu63kD2gvwjyOF5/xrXFjIiAcVe6MOOknnlBbSLOlqu3?=
 =?us-ascii?Q?rCX/IDI3C07iddFqjscP6XjIhhlzB+1l/aTEs3dHuELuWtnINWkTTnXRgLgh?=
 =?us-ascii?Q?ag=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b80abbe9-6c6a-49c0-ccf1-08dc110778b2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8592.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 11:38:16.8462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CteJbKDlasxCCp70X5mtqsvXouukQDyD6V00C/fu72N3jzaJJ9b8bOPJ+7PNwjoi5nqjc2Zd5hNRXtdVr2rgxI0ZzOSmAOibkJo1sFMkKuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR01MB7642
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jan 2024 11:38:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4753

On 08.01.24 15:59, Michael Opdenacker wrote:
> Hi J=C3=B6rg
>=20
> On 29.12.23 at 11:29, J=C3=B6rg Sommer via lists.yoctoproject.org wrote:
>> From: J=C3=B6rg Sommer<joerg.sommer@navimatix.de>
>>
>> UBOOT_CONFIG accepts a third parameter for the UBOOT_BINARY that isn't
>> documented. To show its usage another example from the meta-freescale
>> layer
>> was picked.
>=20
> Thanks for the patch!
> I'd like to merge it, but it doesn't apply when I save your e-mail to a
> ".eml" file and run it through "git am".
>=20
> Did you send it with "git send-email"? Looking at the message source,
> some lines are mangled.

Yes, I've used `git send-email --to docs@lists.yoctoproject.org -1`. I
resend it and set you as a direct recipient.


Kind regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


