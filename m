Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A30ECD37B9
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 12:25:50 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48544.1778502340502774073
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 05:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=TFKTKxU7;
 spf=pass (domain: cherry.de, ip: 52.101.69.20, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVifAi2rteOLx0xOc8oDgYaHHHOu7zwVJPS7NTyS80a1V+Q+Rbg8uZIgHc5slH0AyEapeKgPTXa5DXTMKYgduI+8IZQ1hFe0mPWitB3DNiYTEX+Bs5ObhkUN5hRQ1v7AUhXY7qxoyRxfl+5fnc6xgzJbpbhr8nbXyVyM4CAZwmthF7kVW50UCHSeBmtHctlkAs5R9ye+pW71Fx0NAh+XF6W4yBoU9gFf8u8Hw5UwTzbzj7flg1cAEwPBkWi/ZqKbPFCwTY9Sxn11aXPbMTcpEcHJ6sZuI21fbAX5ZsmZvkuzI2OFsGl9uwshIk4ZqJalsuOSqECeN6MJ0CIZYc/mtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hz6lHUZxh4IjVFpU6BQUlix32oexUkhvdZ3wT9wP2d0=;
 b=CidWow5Q8B5aRuG/lrtDkRjM9yta7zaEpJn7hZMMF1ktsZAuVp3OtJ6y4SnmZ4cETaRTbr4qIXZqNOS32Bbo/E8TBK8Rerrf0YRY6++uM4uYEJEucLP4v7z15hb6pYzdJDObXOjgxBoFRYdmu58Ai3Ycjs4MB1PVozhrCMmcHtTrtx9pX/guZ6D7a3HHARiUysCqp+HRwQImjitl5chR4Zgmo18VB+EGv4NuSEhwM6UIVxm5jJ7K3jejsU+nGBNzlFndu8ySfTARuwXtUhNysNBh2d0gOjCPOg1xUnE6VwVgV2PGOKSgXTwjR89r98JKpJ4DpCdGf5sLCBtkPCIDow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hz6lHUZxh4IjVFpU6BQUlix32oexUkhvdZ3wT9wP2d0=;
 b=TFKTKxU7JVcpoDZ1Xs5zENy9ZGA4jurDWH3WwWtORQAJNG8vON074N2KFmxJK8IYdi874MEIiaQkoTtsiHfADkeafpr2KR2GN4b5cjlgeHU8IYwWRZ8qWMTmYOBNw1AAjmWb6ZwkqpRi+wqJgWGpQX8D6guwC6BzN/CpqZqs+Cc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AS4PR04MB9337.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 12:25:32 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 12:25:32 +0000
Message-ID: <dc5dfd02-de37-4599-96db-fb94cd547c47@cherry.de>
Date: Mon, 11 May 2026 14:25:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] "Transitioning ..." doc: Various pedantic cleanups
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <24eff5f0-982b-fd5a-4483-1d5b7ec40514@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <24eff5f0-982b-fd5a-4483-1d5b7ec40514@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI4PEPF00000121.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8b2) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AS4PR04MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 48bca1e0-64c7-4c3c-3736-08deaf586538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|11063799003|3023799003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	25p4+ZLQODwbWT0LZSxDFbVpgNbaYKNG3w8HGhVSelAQlzv95sVP8jLoZXV1III/X9nTdOioXaPswZcDMJkldD1Y3I2TLBTO1eZfL74HEEkLF1jYQmlaRUTSxdmG1xwistGaWkohlPYKxyfVxbgSzPcKTnouk+aPnmH5Hl3A6n7gUKTW2qyl0YHRjdEIMHP0iLV82tSjY3ERbUuxUXMRK9mLzrv9MWgUXnu2eOscpzhh7vQEl4wuHDIaH7DUvYu6hdZp52PkqeJW5cFSJUa3LHR0Sey8Bj2do5xVYQyJUlyLHw3ykYQeM9ZRuWhO5vLWwPoaDAjatIgdy+lMWAt+ER469Rl2uq/3YGk/y47xqDejJvHxX0oziUpehAK7foB+v2UrGYQdVFbVIBnMP9HRh+Dxo5z+T9SiBqj/7b331UfXQDpUdD15u0V4ZqXvADtsScqZi+fbGCiMNpbzHGTwa0OdmINMmMM7aX7Y1jZvahmRCHWknNQcpSYS8SyBMveozJDNR0bIGFKBHG1ilArJjE+5298xh/nXhMyJQbevZgNcCCW/bQVLJR75sx1np+cTfU4jcJFjgUdbgwey4bwbJW8UglrZSQEeKYy4NQVRIbiC5WBD2XanMP36MP1VG/sx1Qv/bej+9bG/SIKHadixv4gR1WB9sfU7m8E04okgugIjM+cQxJ2rSEQrW+2ihpNo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(11063799003)(3023799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IGyHDP394nl4tLUm54YKYli1rwJfpfRDenteXl3zf+BYenEgv3z7b0s0aoLq?=
 =?us-ascii?Q?2NfQYmO8mTC0NIr/+Tbbe08NGa9Pigi4U93c4wT/bnZ8++juyf+WWRyA59Xo?=
 =?us-ascii?Q?grFTw64lpW0svyrEecD5l9W4Eh3fKyjxiEtqKtniy54apyVHKVi4uZc6Z9Y2?=
 =?us-ascii?Q?qXtHRyPthmcCiRz6HFSV1yBe7SVoNB1NcutLbsfk7Q65A6xmwHPwiAV7esEI?=
 =?us-ascii?Q?8egCpeGRTtMp/QFsKTh5eTWZ62Ke2k36XR08Q6cX73PPrZPtG3sQ24ClF4cn?=
 =?us-ascii?Q?NKaT+vrY5901xXaDxxy2Xpdbbe/2kqGsctv7KP/qFMqru2c47cO1NK0sufGA?=
 =?us-ascii?Q?Fr2XFfZ9RHn8gg4j+Y8QZ2zuhov3UOE3zZeeqPybvNiQu587aF2FGGDA8MCN?=
 =?us-ascii?Q?zDTS6ySRp8ghezD1IxQCB7/t5zs++GfMwB7yyhXl1stbj896ECdDsFc/DoK/?=
 =?us-ascii?Q?6FanLD9L6NPYm69dyW012sQwAv+mojJuM8XeApFMav6PfvnLMSw/NG95sH7o?=
 =?us-ascii?Q?Dmz+FytnGHF4/NkrvNZTD9EDasPU09ZMYfFjugOF3uVK6M0FS7xf4yIHdkay?=
 =?us-ascii?Q?D4G+vh8Kz1DbjmFU86J8n7tzTbHkrSz9E1VpP3WeQaXSk38pZde77CDgFRXy?=
 =?us-ascii?Q?0Op/pulVxO/mGQ0mw8x9kZlqE9Ndz+2XBDsX6hdwYArZH5rHxw6Evx5n8Q0+?=
 =?us-ascii?Q?lYhdbFknWptkcJS11XMsZdtM+51aE6VPBnOk5oyUdmUnAIeKtvnrp8KkvVUm?=
 =?us-ascii?Q?uUIfcd9DCW6RtidsdzybA+p/k2+tbXXWb3jn14wHpcelFI/6uWF3FbQs5V/V?=
 =?us-ascii?Q?e3suEkLlzeuOc/y90nzUyNnwhAh82lEtaJ6KOP0gfGl6a3aP69M81LaeuSnw?=
 =?us-ascii?Q?tpcaj57ArXsi0KygVadax1zQ3Dq0dML9ehm7uIg9L5mTGfuj94HJB/dKm9r0?=
 =?us-ascii?Q?S0doXVH4izbw02ojc8cZrI7ZNYc3OXh4YJ3QcC+7Ph6hEPIqz28xJjwBtF1K?=
 =?us-ascii?Q?02QVCJzj678cE6wElSK8P76h6GLr6ynPjTm/dFmFIBVBSJUTNKOul0WkZWCi?=
 =?us-ascii?Q?uU4fkO+BwCIq0mmKOIPmcZ6IYUqOUfoFtPt4u3tdg4DklIvR0c4T7Xd+XHlg?=
 =?us-ascii?Q?dCLorebULByQOdriPK+4TEe4Wj4uYd+OgKyv2qbRKfTMDgNfBqnil6jAKPbc?=
 =?us-ascii?Q?Fv/OzGEXe1GJI168sQdVA/SHvlnAAPotJ9I2+NC60dV5Ukp6aVs8N5LJk/5s?=
 =?us-ascii?Q?hE0SihhPWFPlHAV0XeYf66U7mM1nEHfzmsSiyvqUgEnN5MX949ATp0F+cOxc?=
 =?us-ascii?Q?JhVeklIEEpQGmShwr9HQC9BuEZG4s+GC5XjRMBJDdKqwsuEGmZJUYttF9QNM?=
 =?us-ascii?Q?4BMQtKGTlSOpQQ/74lW6n0kai9vh+kBwWSa8jcOhsAxIZeGpH+BE0h4ov5SX?=
 =?us-ascii?Q?c9K2sPArHmroiZjhbIkzMlrpjcvJgwQ9F8Y4v3PJNA+KVs3KEYWn84dBugyg?=
 =?us-ascii?Q?qlLuzzgKyqcpON/s/ARohFWj4tmxMMKvtscAIiYYuu643MyZLLgJx3ZQUaM2?=
 =?us-ascii?Q?H0deBjCE2Junj9WSH+wDqzFqI1WUFuRQ1E8wPkY2DlYuWxrqKrAvAT0mCW3T?=
 =?us-ascii?Q?IHlDK00fKuedbBEaIikhp3qb2ibpYfhvBrnKBQsxnJwnX4b+AXt+tsThrX7v?=
 =?us-ascii?Q?NcRS7VhSFYVAXyHvrzGO7E1BTXinb/abIHgdCrmb0ErtUA38FHebK1gzdDU6?=
 =?us-ascii?Q?duarsNuvLg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 48bca1e0-64c7-4c3c-3736-08deaf586538
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 12:25:32.4813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euBPVAmaj6tQC1a4T2WRDf1HiJ+5OaXkzm/S39BL3Yttg5lZCwcf6JPR7sJNXU9DAgqoes5oHw7vaa6AgzxLgK0xmsmtxvrZSzEDMqnUkuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9337
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 12:25:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9448

Hi Robert,

On 5/9/26 11:00 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>=20
> Tweaks:
>=20
>    - grammer adjustments
>    - hyphenation
>    - monospace font for layer and file names
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
> diff --git a/documentation/transitioning-to-a-custom-environment.rst b/do=
cumentation/transitioning-to-a-custom-environment.rst
> index bc37345b9..c69ab5361 100644
> --- a/documentation/transitioning-to-a-custom-environment.rst
> +++ b/documentation/transitioning-to-a-custom-environment.rst
> @@ -9,10 +9,10 @@ Transitioning to a custom environment for systems devel=
opment
>   .. note::
>=20
>      So you've finished the :doc:`/brief-yoctoprojectqs/index` and
> -   glanced over the document :doc:`/what-i-wish-id-known`, the latter co=
ntains
> +   glanced over the document :doc:`/what-i-wish-id-known`, the latter co=
ntaining
>      important information learned from other users. You're well prepared=
. But
>      now, as you are starting your own project, it isn't exactly straight=
forward what
> -   to do. And, the documentation is daunting. We've put together a few h=
ints to
> +   to do, and the documentation is daunting. We've put together a few hi=
nts to
>      get you started.
>=20
>   #. **Make a list of the processor, target board, technologies, and capa=
bilities
> @@ -23,7 +23,7 @@ Transitioning to a custom environment for systems devel=
opment
>   #. **Set up your board support**.
>      Even if you're using custom hardware, it might be easier to start wi=
th an
>      existing target board that uses the same processor or at least the s=
ame
> -   architecture as your custom hardware. Knowing the board already has a
> +   architecture as your custom hardware. Knowing that the board already =
has a

Not a native speaker but gut feeling is that "that" is often optional=20
after a verb.

>      functioning Board Support Package (BSP) within the project makes it =
easier
>      for you to get comfortable with project concepts.
>=20
> @@ -34,19 +34,19 @@ Transitioning to a custom environment for systems dev=
elopment
>      target board. The Yocto Project layer index BSPs are regularly valid=
ated. The
>      best place to get your first BSP is from your silicon manufacturer o=
r board
>      vendor =E2=80=93 they can point you to their most qualified efforts.=
 In general, for
> -   Intel silicon use meta-intel, for Texas Instruments use meta-ti, and =
so
> +   Intel silicon use ``meta-intel``, for Texas Instruments use ``meta-ti=
``, and so
>      forth. Choose a BSP that has been tested with the same Yocto Project=
 release
>      that you've downloaded. Be aware that some BSPs may not be immediate=
ly
>      supported on the very latest release, but they will be eventually.
>=20
>      You might want to start with the build specification that :term:`Pok=
y` provides
> -   (which is reference embedded distribution) and then add your newly ch=
osen
> +   (which is reference embedded distribution) and then add your newly-ch=
osen

Aren't also we missing a "the"/"a" in "which is reference embedded=20
distribution"?

The content in this patch is fine (the note above can be patched in a=20
separate patch as well if there's no need for a v2), so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

