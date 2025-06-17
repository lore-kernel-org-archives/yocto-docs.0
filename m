Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D78C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 14:08:21 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.63])
 by mx.groups.io with SMTP id smtpd.web10.19880.1750169298087318739
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 07:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=P9Kxdkvj;
 spf=pass (domain: cherry.de, ip: 52.101.71.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ya+LZAgbbfbC3jJbLOPNDXU5Qh9lohGABVbbApJ3Fv8VEu/FWtVwkFWuB2wNrVv22qW0HngFe/ar3WATI/RpdRY7XjhZqEkGhqB0/ULjNNpkjJGjgML5CLzPCHhzA0U+YjRX4wnZm8gmuBrJjbi+X58OBuOielniErv0hnt4Kqvjsc+45LfZpdzw25ywZVu+qT3KtKD2vz/dZ02R3p5EorqNlkuufMDjHKQfWwHxoAIqe6Bwc8n1vhV+yTKU931yJF5pvTvsuORDsBxMHZCCJNqdA7/ounLsB8XBcjXe5G6sh4+ob5tf7Hv34oziuoGlPcqFklg7xRF156Xpd+2Rmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eqDJwHdKFXtGSiD4fSQgww3TnPsqUgClDHenrhL7Is=;
 b=jQRcJxgKu85SNoatvGzmVrohKUothlmJ/BSLYQ1Ygi59Xkcq3KhRW9l10RFtufNoypdBr9w6h6EAvFsffg3gGX6WqCJywHVt6wtWPgoutGRHuwsvhb5XD74q2mLlwICOu0r4KcD4ZjcJRMjb2dmv1T/Txhlf2euKvLj/hbXKlPw96Zd/ldao1Qe/8Ufeq9eh4+ZqGCk4YItZuZ20FhejOvVeOmomUjyfBe4qTnsZCYysmBFN6WcVpC6d2J3ZzW6B9xHr9OOTaZYmfD663Dv7EFsKHK53+TdWqsuj7Oe8uGFMZyLOuG4jMUELLbWQzV8BKCkhkzxLgBrF8I9Tw7ktLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eqDJwHdKFXtGSiD4fSQgww3TnPsqUgClDHenrhL7Is=;
 b=P9Kxdkvj/2B4nKHJQQh4/50yI2OaaghFN9B+QaBpyzUX9pBGxaLzt4NOy8sV5SIxJdADNO8/kl+fUO2R14AWU7RH69rOIePZ3ME24GRhjHMt6MsUuQ4WuKJssqKkkhyPr2bwPuapWzOi5eDEvg4ZA42i54O9Ysk2K6a2d58Z3Rw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA2PR04MB10237.eurprd04.prod.outlook.com (2603:10a6:102:401::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 14:08:13 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 14:08:13 +0000
Message-ID: <8836af50-f14c-46ca-b2b4-4f75b41cac5b@cherry.de>
Date: Tue, 17 Jun 2025 16:08:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] bsp-guide: shorten contents of meta-raspberrypi
 layer
To: antonin.godard@bootlin.com, "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <77b2c035-7eec-2c34-e433-55d0e713234c@crashcourse.ca>
 <DAOSRZNTWZPG.39BPC2BOM11M2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DAOSRZNTWZPG.39BPC2BOM11M2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FRYP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::20)
 To AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA2PR04MB10237:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b42ce9-2170-47b3-87fd-08ddada86587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9T++4y8hdMQIOg/G8Mw1uIXZhlCtg+rqrjsTb5T5Ls8foGYioUuhcMHARHbo?=
 =?us-ascii?Q?+/DR/xKKeaoPYsltmnxGXrztTUg80A88NcVqO+YcsyMRRXJVmoYRfb5O4FcO?=
 =?us-ascii?Q?ioq9UGFyRW6xZj819LBvXUCvoLckze/fCesDxywAEyELLLX9Sw5rVxMysn6C?=
 =?us-ascii?Q?v1MG+sAYnQMOkURAREFsqUOr8Wg11vvz6GKGtTN9zGUUyK/Cgeow+vM6dV60?=
 =?us-ascii?Q?JwNjnYtJuU7QWvEvsRatyHzf0nnCClB2yYEyy/YRhn1auus66Ih44LvIZOec?=
 =?us-ascii?Q?dAzsR75yHNFanKznAZ/4pbuzzaZ2p5I8OxgaKkbjbvoSCWJQ19QL0yTXL3KL?=
 =?us-ascii?Q?ziQhTsV8i4tKx7H+DbkZCWVyOS+hTco4RsCdw57tjDwd3NoZamrRxAihwX5C?=
 =?us-ascii?Q?e4ejWKOCG3VehR7C+p8mRKzt+fPH9wFrtdkoUgeHakmI7D4kr9fARYPQtsrA?=
 =?us-ascii?Q?q4Sfh0CaKJZf9QD/71s3RaCr89AZFa+pgE7QAeuW8NiQY7Ly7cV/MLd4o6gO?=
 =?us-ascii?Q?u4P3nw7j39DxYLLxQN2I/oFa0/wjiBh/4G4oBlWFyFzVEfsB5QbOe74srD88?=
 =?us-ascii?Q?ae8lwJ3yUIb96a476TvWZmHE34p2uqmuAOwalsTBUsugQb1j+kAWXyYyd+bV?=
 =?us-ascii?Q?xFPBwiFwxX4nDrXugRWHA3d0/MbrnQMRtcxsoElJMqPJCY3VL7YLdysEY1zg?=
 =?us-ascii?Q?L2QznEmj5IXxcUhtZv62yeax5K7wNwhWt8DP2rHpGkhEi6FR+aVov6sQ9P4o?=
 =?us-ascii?Q?x3HjqsYUB4rgXXmBa+nt/TjkeUFu21EjMAjU/2zG7bGXd3Mi/aSNmt9Me7q7?=
 =?us-ascii?Q?k6VpegkZvh/cGd/7MxaoW158EpU99h05INBNglp6DnOiQcQFEq7evjETHcjS?=
 =?us-ascii?Q?/hRWONKCfusszGxQrZOA3dMemNi5FjExVJ81PJg9mbuvMQyKTUwDGcKUFvc/?=
 =?us-ascii?Q?d1g9xtCQC4A8m+lYa2U0BkgoZjyytw5ickkVvaB+N0fnLyIC3yPsGh20IjB2?=
 =?us-ascii?Q?CwvVNl7N07x9k4Eqx97wTW4ovFrLlqWTTy++dgP5p5+6PnSZPtfxiriQiZpa?=
 =?us-ascii?Q?QDfsIqnFqP/LpXQ9rT+FBLDQ5DcE3uQRVZWF/qlZ/gh/YMsoCYU7QDZvrBDQ?=
 =?us-ascii?Q?6WIxnJnQRhcksIGWN+mzrSsAMCv8d/tHHhKcBZD5cX2zp1KbXrP3Sh1tHsi5?=
 =?us-ascii?Q?CzOJ635Vif6rzwQoYt5733wcFfIvrld3GZwvgvOxPR7w59W7BuZq1xWlkKfh?=
 =?us-ascii?Q?oDpwUpoN2Ypb96+jXWlUUfZyJCjxD3C63YW+Sk3HvOy5/ca85Ca70+TF5U3s?=
 =?us-ascii?Q?3U3Uao/u0BkWKxk1nUCuVu9pK64TdgWc4I/8WrXuHD+CDvnlS0AUaeAO1pPf?=
 =?us-ascii?Q?fGBulp50VeklTfwVsfx1uentr8geehNiz256UOGh0LYOeWvjkg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CgLPzxkL2pS0bSf3Psxl8TE/C2WnCDddqTYqjUewTjwcyVh57GBBifZa4K4D?=
 =?us-ascii?Q?QCurtoWSbTcAVTk34n5ORMw0I/+cFrMheoPzcMsI7MRNNCtMibcPIaXKnWS3?=
 =?us-ascii?Q?7AGy6gLzhRIRtfNB20u7ScV1NTJM5yO6gadnok9PDQfHV0tvEo32xHx0XQ8h?=
 =?us-ascii?Q?Qj8Z3H+tm0VYiXDNALVryHiNFk9LQSuo/Zir5JeQ8tZzQcaIfPOQwme2KLLS?=
 =?us-ascii?Q?CKhelLeVMhjRxm6DsHq4ktPk7IbZt5Y6b4XIQpuWJnpclzoPhx/I83aGMu1R?=
 =?us-ascii?Q?riQv0Vro7fV6xxJV4HdYIKbXFLGamv5mnJIJxnlwwDVK++UrBPI3ajAc99px?=
 =?us-ascii?Q?MC8GnJPReb1Dy7PUZppBqhZ1zobZkEdD/QrZPjIKVTFwUzsWA11FcipY9/bJ?=
 =?us-ascii?Q?dE7cJHrTzDlIE8O+FE7CqX/fsKINSylhKxQlPDmXcX48kEsK0tj6BUnW0D8j?=
 =?us-ascii?Q?smlLYBRI6pDw3H4aCvsF53f86LTB5qPrOEbmwPzPAqHpjZ3NalZsFDr0jM/F?=
 =?us-ascii?Q?TENpzVA2sgILgj17Yinl7CWLfMPUTdq0YL792GDkXGkhKp3sLCkltz7t6CME?=
 =?us-ascii?Q?GSMk69xPiKmenK3OoYUALyJ3Bu3qYHhTdklpNH8BCHTn0n0rl1M9owj+lTTK?=
 =?us-ascii?Q?ggkEpi+NJNxZtYhq/2LIAPJlUuykD5OGsKn4HOjKKMTQ4a3qwSJ2Of26P8gZ?=
 =?us-ascii?Q?kSwl6H85Awat7jl4knK7R0XdMxLHAC3u0RNFMcoDzPbKP2ppMj9m3qK84Trx?=
 =?us-ascii?Q?pjgpPowddajTenvhQ8/giMuUEaU5hQQuOqC7VqPF+DNNccGdY/CLO/4ZFrfV?=
 =?us-ascii?Q?z0YrCM/ipkxvGX49NE2TjrCCv92th+U8qNNsBxEB9b/mcXNDY1sGtnK2vLTI?=
 =?us-ascii?Q?yL5PPnEJ6zLDWuPpQdXBynLaN/GSS3cgDeAPrm/kW1juPXiQsGyz+Wg4Jz+3?=
 =?us-ascii?Q?Y28n5Wc57TF+qPATZ4odSoxBYELygKVpEbH8HrJhhwf1crxdi3PNB53er3ru?=
 =?us-ascii?Q?vzr9+Qr/9PIS4H5N9SlmkcDBDzM2Pq6gaWYJ4lM8fEb+FKJOol+cP+d0GgbE?=
 =?us-ascii?Q?MrBeQisjLFcSIKDnptjnCI+AQl+wN2SW8XWZ9q6rhl5Lu4mnfqZhRhK0AHz1?=
 =?us-ascii?Q?zvG8E0PHV6bWVoCdSXuQijzMqILdPTCDljnT0qRrqfp+KHc+sUsnR/FqdAER?=
 =?us-ascii?Q?KSO3MLvKYHzL+sfpD8MS2v4jO/UxnBZBYrhi6BLrVmE2iTPp0eFKY3SZSl9O?=
 =?us-ascii?Q?nUpm74l9KAEhqKHsG6n++BvubLHX5q1VPJYPY2WbASKoxQgd3Ji/w0GCvdM+?=
 =?us-ascii?Q?6azNLaboXXis6raaUS1GlNEHa13yLdhMrDO6hbbEVMXZ9XvJ6opjfyGTwCwn?=
 =?us-ascii?Q?waObYc814/3cc7V+2zgLkR4Sp094TCtSLJDDX3yRpQ8U/ykxKd1hGE+8Iuoo?=
 =?us-ascii?Q?RHawCMmFZJ2w3AZugT4DO+kTIhbbD1OdlEjcoosSqRRVQMMV5N2cPDrt3POy?=
 =?us-ascii?Q?+FTLrQLx0Kk1suNUwAjiPstGn56zB7r9CCxkTbsK1CSD+4jVikK+3+ukL04q?=
 =?us-ascii?Q?XCJhP8Hbej05gI1CjSitfKz78VjHQWVsXrKq2rVtyFG9feRAMhMFmPz1c8cF?=
 =?us-ascii?Q?EQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b42ce9-2170-47b3-87fd-08ddada86587
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 14:08:12.9446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GUyNk1TqniuXYUZnBK1gT8k/nrmD2UZjdiH/6G1a2+wkITEHka1V/SBRx2kfXHoO2018Z610dWacNhIEzFs0i/wg0JtVl006+SGDROFKOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10237
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Jun 2025 14:08:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7085

Hi all,

On 6/17/25 2:12 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Hi,
>=20
> On Tue Jun 17, 2025 at 11:52 AM CEST, Robert P. J. Day wrote:
>>
>> It seems overly verbose to list the entire contents of the
>> meta-raspberrypi layer, so this replaces all of that output with a
>> shortened version displaying only the more top-level directories,
>> which still gives the reader a good idea of the overall structure of a
>> BSP layer.
>>
>> If the reader wants more detail, they're free to check out the layer
>> itself.
>>
>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>
>> ---
>>
>> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/b=
sp.rst
>> index 35972f172..97c9c1bf2 100644
>> --- a/documentation/bsp-guide/bsp.rst
>> +++ b/documentation/bsp-guide/bsp.rst
>> @@ -288,163 +288,82 @@ individual BSPs could differ. ::
>>      meta-bsp_root_name/recipes-graphics/*
>>      meta-bsp_root_name/recipes-kernel/linux/linux-yocto_kernel_rev.bbap=
pend
>>
>> -Below is an example of the Raspberry Pi BSP layer that is available fro=
m
>> -the :yocto_git:`Source Repositories <>`:
>> +Below is the abbreviated content of the higher levels of the
>> +``meta-raspberrypi`` BSP layer that is available from the
>> +:yocto_git:`Source Repositories <>`:
>>
>>   .. code-block:: none
>>
>> -   meta-raspberrypi/COPYING.MIT
>> -   meta-raspberrypi/README.md
>> -   meta-raspberrypi/classes
>> -   meta-raspberrypi/classes/sdcard_image-rpi.bbclass
>> -   meta-raspberrypi/conf/
>> -   meta-raspberrypi/conf/layer.conf
>> -   meta-raspberrypi/conf/machine/
>> -   meta-raspberrypi/conf/machine/raspberrypi-cm.conf
>> -   meta-raspberrypi/conf/machine/raspberrypi-cm3.conf
>> -   meta-raspberrypi/conf/machine/raspberrypi.conf
>> -   meta-raspberrypi/conf/machine/raspberrypi0-wifi.conf
>> -   meta-raspberrypi/conf/machine/raspberrypi0.conf
>> -   meta-raspberrypi/conf/machine/raspberrypi2.conf
>> -   meta-raspberrypi/conf/machine/raspberrypi3-64.conf
>> -   meta-raspberrypi/conf/machine/raspberrypi3.conf
>> -   meta-raspberrypi/conf/machine/include
>> -   meta-raspberrypi/conf/machine/include/rpi-base.inc
>> -   meta-raspberrypi/conf/machine/include/rpi-default-providers.inc
>> -   meta-raspberrypi/conf/machine/include/rpi-default-settings.inc
>> -   meta-raspberrypi/conf/machine/include/rpi-default-versions.inc
>> -   meta-raspberrypi/conf/machine/include/tune-arm1176jzf-s.inc
>> -   meta-raspberrypi/docs
>> -   meta-raspberrypi/docs/Makefile
>> -   meta-raspberrypi/docs/conf.py
>> -   meta-raspberrypi/docs/contributing.md
>> -   meta-raspberrypi/docs/extra-apps.md
>> -   meta-raspberrypi/docs/extra-build-config.md
>> -   meta-raspberrypi/docs/index.rst
>> -   meta-raspberrypi/docs/layer-contents.md
>> -   meta-raspberrypi/docs/readme.md
>> -   meta-raspberrypi/files
>> -   meta-raspberrypi/files/custom-licenses
>> -   meta-raspberrypi/files/custom-licenses/Broadcom
>> -   meta-raspberrypi/recipes-bsp
>> -   meta-raspberrypi/recipes-bsp/bootfiles
>> -   meta-raspberrypi/recipes-bsp/bootfiles/bcm2835-bootfiles.bb
>> -   meta-raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bb
>> -   meta-raspberrypi/recipes-bsp/common
>> -   meta-raspberrypi/recipes-bsp/common/firmware.inc
>> -   meta-raspberrypi/recipes-bsp/formfactor
>> -   meta-raspberrypi/recipes-bsp/formfactor/formfactor
>> -   meta-raspberrypi/recipes-bsp/formfactor/formfactor/raspberrypi
>> -   meta-raspberrypi/recipes-bsp/formfactor/formfactor/raspberrypi/machc=
onfig
>> -   meta-raspberrypi/recipes-bsp/formfactor/formfactor_%.bbappend
>> -   meta-raspberrypi/recipes-bsp/rpi-u-boot-src
>> -   meta-raspberrypi/recipes-bsp/rpi-u-boot-src/files
>> -   meta-raspberrypi/recipes-bsp/rpi-u-boot-src/files/boot.cmd.in
>> -   meta-raspberrypi/recipes-bsp/rpi-u-boot-src/rpi-u-boot-scr.bb
>> -   meta-raspberrypi/recipes-bsp/u-boot
>> -   meta-raspberrypi/recipes-bsp/u-boot/u-boot
>> -   meta-raspberrypi/recipes-bsp/u-boot/u-boot/*.patch
>> -   meta-raspberrypi/recipes-bsp/u-boot/u-boot_%.bbappend
>> -   meta-raspberrypi/recipes-connectivity
>> -   meta-raspberrypi/recipes-connectivity/bluez5
>> -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5
>> -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5/*.patch
>> -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5/BCM43430A1.hcd
>> -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5brcm43438.service
>> -   meta-raspberrypi/recipes-connectivity/bluez5/bluez5_%.bbappend
>> -   meta-raspberrypi/recipes-core
>> -   meta-raspberrypi/recipes-core/images
>> -   meta-raspberrypi/recipes-core/images/rpi-basic-image.bb
>> -   meta-raspberrypi/recipes-core/images/rpi-hwup-image.bb
>> -   meta-raspberrypi/recipes-core/images/rpi-test-image.bb
>> -   meta-raspberrypi/recipes-core/packagegroups
>> -   meta-raspberrypi/recipes-core/packagegroups/packagegroup-rpi-test.bb
>> -   meta-raspberrypi/recipes-core/psplash
>> -   meta-raspberrypi/recipes-core/psplash/files
>> -   meta-raspberrypi/recipes-core/psplash/files/psplash-raspberrypi-img.=
h
>> -   meta-raspberrypi/recipes-core/psplash/psplash_git.bbappend
>> -   meta-raspberrypi/recipes-core/udev
>> -   meta-raspberrypi/recipes-core/udev/udev-rules-rpi
>> -   meta-raspberrypi/recipes-core/udev/udev-rules-rpi/99-com.rules
>> -   meta-raspberrypi/recipes-core/udev/udev-rules-rpi.bb
>> -   meta-raspberrypi/recipes-devtools
>> -   meta-raspberrypi/recipes-devtools/bcm2835
>> -   meta-raspberrypi/recipes-devtools/bcm2835/bcm2835_1.52.bb
>> -   meta-raspberrypi/recipes-devtools/pi-blaster
>> -   meta-raspberrypi/recipes-devtools/pi-blaster/files
>> -   meta-raspberrypi/recipes-devtools/pi-blaster/files/*.patch
>> -   meta-raspberrypi/recipes-devtools/pi-blaster/pi-blaster_git.bb
>> -   meta-raspberrypi/recipes-devtools/python
>> -   meta-raspberrypi/recipes-devtools/python/python-rtimu
>> -   meta-raspberrypi/recipes-devtools/python/python-rtimu/*.patch
>> -   meta-raspberrypi/recipes-devtools/python/python-rtimu_git.bb
>> -   meta-raspberrypi/recipes-devtools/python/python-sense-hat_2.2.0.bb
>> -   meta-raspberrypi/recipes-devtools/python/rpi-gpio
>> -   meta-raspberrypi/recipes-devtools/python/rpi-gpio/*.patch
>> -   meta-raspberrypi/recipes-devtools/python/rpi-gpio_0.6.3.bb
>> -   meta-raspberrypi/recipes-devtools/python/rpio
>> -   meta-raspberrypi/recipes-devtools/python/rpio/*.patch
>> -   meta-raspberrypi/recipes-devtools/python/rpio_0.10.0.bb
>> -   meta-raspberrypi/recipes-devtools/wiringPi
>> -   meta-raspberrypi/recipes-devtools/wiringPi/files
>> -   meta-raspberrypi/recipes-devtools/wiringPi/files/*.patch
>> -   meta-raspberrypi/recipes-devtools/wiringPi/wiringpi_git.bb
>> -   meta-raspberrypi/recipes-graphics
>> -   meta-raspberrypi/recipes-graphics/eglinfo
>> -   meta-raspberrypi/recipes-graphics/eglinfo/eglinfo-fb_%.bbappend
>> -   meta-raspberrypi/recipes-graphics/eglinfo/eglinfo-x11_%.bbappend
>> -   meta-raspberrypi/recipes-graphics/mesa
>> -   meta-raspberrypi/recipes-graphics/mesa/mesa-gl_%.bbappend
>> -   meta-raspberrypi/recipes-graphics/mesa/mesa_%.bbappend
>> -   meta-raspberrypi/recipes-graphics/userland
>> -   meta-raspberrypi/recipes-graphics/userland/userland
>> -   meta-raspberrypi/recipes-graphics/userland/userland/*.patch
>> -   meta-raspberrypi/recipes-graphics/userland/userland_git.bb
>> -   meta-raspberrypi/recipes-graphics/vc-graphics
>> -   meta-raspberrypi/recipes-graphics/vc-graphics/files
>> -   meta-raspberrypi/recipes-graphics/vc-graphics/files/egl.pc
>> -   meta-raspberrypi/recipes-graphics/vc-graphics/files/vchiq.sh
>> -   meta-raspberrypi/recipes-graphics/vc-graphics/vc-graphics-hardfp.bb
>> -   meta-raspberrypi/recipes-graphics/vc-graphics/vc-graphics.bb
>> -   meta-raspberrypi/recipes-graphics/vc-graphics/vc-graphics.inc
>> -   meta-raspberrypi/recipes-graphics/wayland
>> -   meta-raspberrypi/recipes-graphics/wayland/weston_%.bbappend
>> -   meta-raspberrypi/recipes-graphics/xorg-xserver
>> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config
>> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/r=
pi
>> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/r=
pi/xorg.conf
>> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/r=
pi/xorg.conf.d
>> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/r=
pi/xorg.conf.d/10-evdev.conf
>> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/r=
pi/xorg.conf.d/98-pitft.conf
>> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config/r=
pi/xorg.conf.d/99-calibration.conf
>> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xf86-config_0=
.1.bbappend
>> -   meta-raspberrypi/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappe=
nd
>> -   meta-raspberrypi/recipes-kernel
>> -   meta-raspberrypi/recipes-kernel/linux-firmware
>> -   meta-raspberrypi/recipes-kernel/linux-firmware/files
>> -   meta-raspberrypi/recipes-kernel/linux-firmware/files/brcmfmac43430-s=
dio.bin
>> -   meta-raspberrypi/recipes-kernel/linux-firmware/files/brcfmac43430-sd=
io.txt
>> -   meta-raspberrypi/recipes-kernel/linux-firmware/linux-firmware_%.bbap=
pend
>> -   meta-raspberrypi/recipes-kernel/linux
>> -   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi-dev.bb
>> -   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi.inc
>> -   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.14.bb
>> -   meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb
>> -   meta-raspberrypi/recipes-multimedia
>> -   meta-raspberrypi/recipes-multimedia/gstreamer
>> -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx
>> -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx/*.pat=
ch
>> -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx_%.bba=
ppend
>> -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-plugins-b=
ad_%.bbappend
>> -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx-1.12
>> -   meta-raspberrypi/recipes-multimedia/gstreamer/gstreamer1.0-omx-1.12/=
*.patch
>> -   meta-raspberrypi/recipes-multimedia/omxplayer
>> -   meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer
>> -   meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer/*.patch
>> -   meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer_git.bb
>> -   meta-raspberrypi/recipes-multimedia/x264
>> -   meta-raspberrypi/recipes-multimedia/x264/x264_git.bbappend
>> -   meta-raspberrypi/wic meta-raspberrypi/wic/sdimage-raspberrypi.wks
>> +  =E2=94=9C=E2=94=80=E2=94=80 classes/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 sdcard_image-rpi.bb=
class
>> +  =E2=94=9C=E2=94=80=E2=94=80 conf/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 layer.conf
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 machine/
>> +  =E2=94=9C=E2=94=80=E2=94=80 COPYING.MIT
>> +  =E2=94=9C=E2=94=80=E2=94=80 docs/
>> +  =E2=94=9C=E2=94=80=E2=94=80 dynamic-layers/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-python/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 multimedia-layer/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 networking-layer/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 openembedded-layer/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 qt5-layer/
>> +  =E2=94=9C=E2=94=80=E2=94=80 files/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 custom-licenses/
>> +  =E2=94=9C=E2=94=80=E2=94=80 kas-poky-rpi.yml
>> +  =E2=94=9C=E2=94=80=E2=94=80 lib/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 oeqa/
>> +  =E2=94=9C=E2=94=80=E2=94=80 README.md
>> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-bsp/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 armstubs/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 bootfiles/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 common/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 formfactor/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 gpio-shutdown/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 rpi-eeprom/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 rpi-u-boot-scr/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 u-boot/
>> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-connectivity/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 bluez5/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 pi-bluetooth/
>> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-core/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 images/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 packagegroups/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 psplash/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 udev/
>> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-devtools/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 bcm2835/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 pi-blaster/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 python/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 raspi-gpio/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 raspi-utils/
>> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-graphics/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 cairo/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 kmscube/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 libsdl2/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 libva/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 mesa/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 piglit/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 raspidmx/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 userland/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 vc-graphics/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 wayland/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 xorg-xserver/
>> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-kernel/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 bluez-firmware-rpid=
istro/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 linux/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 linux-firmware-rpid=
istro/
>> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-multimedia/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 gstreamer/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 omxplayer/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 picamera-libs/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 python3-picamera/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 rpidistro-ffmpeg/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 x264/
>> +  =E2=94=9C=E2=94=80=E2=94=80 recipes-sato/
>> +  =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libwpe_%.bbappend
>> +  =E2=94=9C=E2=94=80=E2=94=80 SECURITY.md
>> +  =E2=94=94=E2=94=80=E2=94=80 wic/
>> +      =E2=94=94=E2=94=80=E2=94=80 sdimage-raspberrypi.wks
>=20
> Code blocks need to be indented with three spaces (here two).
>=20
> I think it would be good to keep at least one directory showing the struc=
ture
> for a recipe (the bb file, a patch, etc), like python-rtimu in the previo=
us code
> block for example.
>=20

Not sure it actually helps. I can understand it's unnecessarily verbose,=20
but does the information still makes sense with only a 2-level deep=20
`tree` output?

Another way could be to only print files and not directories, a few=20
lines would be gone for sure.

Something like

find -type f

maybe?

Also, we probably don't need the root files, nor the docs/ directory?

We can replace filepaths where multiple files ends with the same=20
extension (e.g. .patch) with one entry with a glob path for example=20
(like *.patch).

Cheers,
Quentin

