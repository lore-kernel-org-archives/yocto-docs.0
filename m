Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32327CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 08:53:17 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.46])
 by mx.groups.io with SMTP id smtpd.web10.72559.1756803188693537578
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Sep 2025 01:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=dYEA6iFF;
 spf=pass (domain: cherry.de, ip: 52.101.66.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iX5A1eQhhA2Gkvu0f0k+weGxpMiQCI69iVV51oMPmGhndQ60gEOF9gsPdeVuP1enptg9B3Ox5fZpKavm+DIaXVtqOk+KDhckycMl9zI6xYdKMe0/OGMQgLUMdSUTrJfu/PMiLONcyIbMzXxNJ4FPvfRx6J4TWIE5hk0BlWWiSYSLFhJ+mkm/dC9eJXI8Ro/Nu74wi23/0YgP46Oh/Uw6weSAd4b4yFNKJR9H29fOZHa/DILTBmvn4/6CS2ltda253Gd2ArOTbOUjP/sAfrC4LdE1OcR4q0emWfXUIKbXZKKtakp7Ddwx4OAtaOPigeMcFNyOk9+Ci1atY/JtpYCVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfbgPjA7H12AuAVwKsDK6ZORtdofPYzi1xi99CkRGKo=;
 b=Q4+pnZElbg9r4fOoNjWb7TUcPfhKmJhsu4gnxnQEKasPp0bEaFcRDPrXQPCsrFuODTDMQEBRdozAvuTQiEgYSt6FuJHluylbbR0KG0pt+7vURyb+Qc51wjyPZqEWBGLuNpye1uQ3C/GdUUlXD835POYUGlqW9QYCmT9YC1nDROmYkw39jXqzwFip6xRQcapmoPxAiTjR9YQ0/MA6qwcfw8RIHxGbe3lnHECd6SJmHfIHV9xspxj65pd0IXNQj129pebjXuomEqnpMTNRnG+xzgeqmcBe3ibhSRuz7ZEy48Nc6eeW16k2sYCFGgawp0SZExDXdpycIT1A0aOviuxveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfbgPjA7H12AuAVwKsDK6ZORtdofPYzi1xi99CkRGKo=;
 b=dYEA6iFFOrTzhA+IanhKweA2V9wWV/k7LuorgmppevgcpEqvfCtopQoDhDwXIOQtKTh6RUkH7X3njL9LWus9q10meUwGMnlPNTwPqfzoO+AZo8WYqVPPQcAPZazJq+BOoVsY50Oulji+SKJdXZnzP/kz8dF8H3RBz9GrwbUX+9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM0PR04MB6769.eurprd04.prod.outlook.com (2603:10a6:208:17f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 08:53:04 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%5]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 08:53:03 +0000
Message-ID: <3b9c6d71-8628-41eb-8c80-e5e7f3b5a537@cherry.de>
Date: Tue, 2 Sep 2025 10:53:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual/security-subjects.rst: update mailing
 lists
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250829-update-security-lists-v1-1-42d02ed2eb24@bootlin.com>
 <d790220a-b0bd-425c-92b4-9e6b9a1c3293@cherry.de>
 <DCI4HPNGMKTB.1NCT4AGVSGSF0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DCI4HPNGMKTB.1NCT4AGVSGSF0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM0PR04MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: a9717277-2388-42a6-ed26-08dde9fe206a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OTXNgdSx11wz1PnbU/xzlSUaXRty5YF/qbNtXyu2/yeZqhcGqMd8lSSCXSYW?=
 =?us-ascii?Q?nESiViIpaQ1LFWyyoTEy4RLV6Jae8xWiA+kyR1gYyL4PWInwRhWYx5DpnhZO?=
 =?us-ascii?Q?dDz5wKg/c6m8hsyItnXWTQowwX4tr/koHAxyfHebgdvcINQWkuKIwYNOTyDQ?=
 =?us-ascii?Q?AjvYk9NECMArWX6Ztv7TTIi7iEDmfjBjBLYAbzSzIZz/5NeLx1N21N04UZKo?=
 =?us-ascii?Q?LDbydcw6CPJuVfUpZGbOfD5g20VnOpwVv+YMbajQ2o07E9lt/LrdB6Wo71O3?=
 =?us-ascii?Q?oDrvy/8o2Bn7+qgdix3DGZyAUh415jXGP9Vs4SYIarG/zbs+0auI1AEZwgnf?=
 =?us-ascii?Q?7t+33NXLrtOcOuT2mLMqPvoyxeYR39FuvuyYNChbWWCFwtmgC4GWa3Iezfw/?=
 =?us-ascii?Q?q/bU2grUqKokhC/SOQ0wNDEm7dtWzQzuZ25I0HTWYSNVbiPlB2bdwD9DmbsL?=
 =?us-ascii?Q?OYSU8szADxCXCK9tMo7fbBhGkLfRYSVHsu2pwTSGaJO+1SnVoiXRpzHvmySS?=
 =?us-ascii?Q?Gpyi+nYkzEZjAN3TsdleshQdecv516aXGo8v6VWCaLaCn/f6FQ3Vkcs4oBTY?=
 =?us-ascii?Q?Lp1Bk4CQWo1JoJRis+Xt/kWLmEexokU/8+jpyvhwpB3cvlNowhZXbyETrKY2?=
 =?us-ascii?Q?0z5SS1jMA2f9LjpdE27vQVlDmuoI0ld+vJG2fbjEE3xWZtdU5d0u/JBvk6Nn?=
 =?us-ascii?Q?RmmyY2cCjASPQ70afDeqgxa66O1bzXiQMv0hZ33ue7OoIgggqfscd7H42va5?=
 =?us-ascii?Q?rMo95OGsdrqWi9ulFHWN6VFvQmyo+/ikKRqCTIE7ZK4ZwsWGyvNxcwvhMRF6?=
 =?us-ascii?Q?cD4uSrSJqR7zgeZPg4WafdPif7zOV9BwZHd58m7570/nox4LGo4kleFFeW0K?=
 =?us-ascii?Q?pv8CICM8pbCbTKrxTuRMAgIw1eebEPAYqj2tiD2p72bqfR+y5fA+Ba1OH4tC?=
 =?us-ascii?Q?XJmVLz6Qyd4agwCX4ryfs6KYMaxTv2l2PryPFN2yRwiYEZ/RjvSq2PIt2CVO?=
 =?us-ascii?Q?0fo7YOJGIZ+ExValNa52RRYUWxfD5enS23mkOaBjSVk0BcQdGMyndKN3RH5V?=
 =?us-ascii?Q?8F+BkFDpvLgnmZxiktuT1On0J1xS9G0dmjPSYB0C6Y0Ky9gdDx90RFpuPxW0?=
 =?us-ascii?Q?NvF/5Ar5/q0QtSEmtyzD9pECVOz+XaEzExmfTp0cGPjjiO64hUYfFj90iwIz?=
 =?us-ascii?Q?6llhyY5zgna/wsV/+vFQ72PaBsQPVFRNEFIE+dFTZfE50D5c8TA1UUQ1EFcQ?=
 =?us-ascii?Q?W2X10MqOPPdGqoVA0lGjpfvwhctQCswUV9sv/r1ACToArfVP6FBTQnB+ZrGj?=
 =?us-ascii?Q?5j/QE5vY28JFgftQcZc2GyRcb7sMGfb31QAzpkQI7tnCRlVLEQBXhYBinfvk?=
 =?us-ascii?Q?mMgnRos=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IZ5Np26YFUt8Ba4Zee1LkhZ/rBo1/Mro88dLdKWDUgbb8ViIsIIPjtLgJy7K?=
 =?us-ascii?Q?6ZIDF896glqS4qky5ZYMVHjNSedoxBtpbv4d4L+aoC6F/xEsi7VLx8DZHSDY?=
 =?us-ascii?Q?hiJkHdUgdFNdqVrhpba6b3aVJCY7fLRCY44OgLnbZs5MS2TgfhBUp42PuNHg?=
 =?us-ascii?Q?+zEdMpZBH9wTgdP71U0VQeaFAVakYartTxk96MvocsxfMhJ4JYf2gEWeYGrc?=
 =?us-ascii?Q?czXDNcVDiy5/bk1FxzumV8m8ETfFCkkUEqJ8bon1gDwZrgqL2hvXxFdCF26n?=
 =?us-ascii?Q?PmYfm7Zhw8sHVcK/V40EjHRwEIyq2lNRGlU3l3ZhhNIrQWuGLYgUcqXJs9X7?=
 =?us-ascii?Q?XhIKxjNcUq0lNCY1O2UZxov8qJzGATbcFPFjwS0rKnsk6mIWdRgzyQnH9T8H?=
 =?us-ascii?Q?6woSPWm3juaAwIXZHNHSpoOkGcH5hHAGHXw5Xcc6EKhtVojMy6KcfsLSnU1X?=
 =?us-ascii?Q?8T8QJCBPQyGvzjwyNoy8XrkWP7mExR3H+k8CGjd00Tkdo8ACjceOhVAqFp8P?=
 =?us-ascii?Q?IqPh7Z5OK4GFyx3EaaILCD1VSrO5jR69d1cokUFJ5wlRqWAhkm+/EVKcFLjB?=
 =?us-ascii?Q?mVw/idbQn7y9ON5z0mJAKJiNwxB3aNZ2XLSxqNZr0liprr78AsQudzX2qgny?=
 =?us-ascii?Q?crBKIFcXweiIYICfpni9gWiHZ/kpuf8XEY0ftD9kziLRM/B7cGqqNryDisc6?=
 =?us-ascii?Q?3H3uaIierZAZGwKHB/ZFGOXAW/jx+J7XyUtSNNzbdAXM+KokrynEG9Oqv3vG?=
 =?us-ascii?Q?BG4dYVLu6ITfn5xoQCD20buxUpG84q11jXFOLQn5xNPC6BSrKoYYeHmYEH+E?=
 =?us-ascii?Q?zoqGDO/I/6Boa/LQa6SSLypUk++nQNJbqozwM3+zknN+JyPT/cH4WigEyvZ2?=
 =?us-ascii?Q?XQwh5vN6o/tUCLF6PV6lXDfhWNn5aTepAjvFBp6/LRavi64WZloelZQOrFcE?=
 =?us-ascii?Q?wggGxRwhyNgqxG9qwiT8XUbE40CXXUsfdGSesHWmFeEDUUWmwIjhyq2I0BN0?=
 =?us-ascii?Q?BiLoSMTSvP/PMhu1Q8DRiGIAQxriXioXRx01wSfgKI5c3tl5JGpwYW+jRujI?=
 =?us-ascii?Q?VZ96nB4iUS6lm+cDYhwbHhR6xdN9q2BE94BF068b9PaOzEGy/yvEFM69y34c?=
 =?us-ascii?Q?u8A6589CLsh2cGd7Pas55GeluOQlq4FmWk0QU+BsUv6X5703soVlhY+GepeO?=
 =?us-ascii?Q?D/bxLFviDwpWbQUSvtPQoNzuYGTp5Aq1ivFxqXKUbeyezOOBCNSTsJPMBjuR?=
 =?us-ascii?Q?VMJit+Ny5diHUODVo6SA3mgwaHDCXuxDsKkk+DL9fle1kZ5rVx2LgqBOxjFR?=
 =?us-ascii?Q?l5BDmr9V69TEjIT/w7qEObFK+qtvcTPY6QQNpUdNaxS9iAQx3AL5JU2DIBc1?=
 =?us-ascii?Q?G6K80ccvqbVr+Jxmh+Ga+Rt1f8j96kSX+sk7GB4VdTfxNnPwVDaFhMcrXNyN?=
 =?us-ascii?Q?ecJILeMU30rn0dQ8ry2dImXAR5RG0wlDwpj1+XPbQo39HafSDCw4hRu4L2hY?=
 =?us-ascii?Q?V/6SoBWyH/w+b7ER5hUTgPCRFE8u431WOjE0SWSog2c+0Lybolwi2UgRq9Xe?=
 =?us-ascii?Q?iHEhPAM6yL0mLituDbFHbNBnPJUd0SlIXag54JzHc6mDl6yVOe8p2fes7tfO?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a9717277-2388-42a6-ed26-08dde9fe206a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 08:53:03.2999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZZ2wF+wxQOXOs2Owvx6kQTagmnNAtXDH52+UZkJqtNpbIr4TsIun0hGydPd3aFRsjJiYPopFkB6Lw8BERixtHmvHo33LpFGoBnc6UBgfuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6769
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Sep 2025 08:53:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7481

Hi Antonin,

On 9/2/25 9:06 AM, Antonin Godard wrote:
> On Mon Sep 1, 2025 at 1:35 PM CEST, Quentin Schulz via lists.yoctoproject=
.org wrote:
>> Hi Antonin,
>>
>> On 8/29/25 11:08 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Update mailing lists following changes by Michael Halstead
>>> (https://lists.yoctoproject.org/g/yocto-security/message/1478).
>>>
>>> Also fix formatting/spacing.
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/dev-manual/security-subjects.rst | 23 ++++++++++++++--=
-------
>>>    1 file changed, 14 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/documentation/dev-manual/security-subjects.rst b/documenta=
tion/dev-manual/security-subjects.rst
>>> index 1b02b6a9e9..6785b5a16a 100644
>>> --- a/documentation/dev-manual/security-subjects.rst
>>> +++ b/documentation/dev-manual/security-subjects.rst
>>> @@ -52,19 +52,24 @@ for them for significant issues.
>>>    Security-related discussions at the Yocto Project
>>>    -------------------------------------------------
>>>   =20
>>> -We have set up two security-related mailing lists:
>>> +We have set up two security-related emails/mailing lists:
>>>   =20
>>> -  -  Public List: yocto [dash] security [at] yoctoproject[dot] org
>>> +  -  Public Mailing List: yocto [dash] security [at] yoctoproject[dot]=
 org
>>>   =20
>>> -    This is a public mailing list for anyone to subscribe to. This lis=
t is an
>>> -    open list to discuss public security issues/patches and security-r=
elated
>>> -    initiatives. For more information, including subscription informat=
ion,
>>> -    please see the  :yocto_lists:`yocto-security mailing list info pag=
e </g/yocto-security>`.
>>> +     This is a public mailing list for anyone to subscribe to. This li=
st is an
>>> +     open list to discuss public security issues/patches and security-=
related
>>> +     initiatives. For more information, including subscription informa=
tion,
>>> +     please see the  :yocto_lists:`yocto-security mailing list info pa=
ge
>>> +     </g/yocto-security>`.
>>>   =20
>>> -  - Private List: security [at] yoctoproject [dot] org
>>> +     This list requires moderator approval for new topics to be posted=
, to avoid
>>> +     private security reports to be posted by mistake.
>>>   =20
>>> -    This is a private mailing list for reporting non-published potenti=
al
>>> -    vulnerabilities. The list is monitored by the Yocto Project Securi=
ty team.
>>> +  -  Yocto Project Security Team: security [at] yoctoproject [dot] org
>>> +
>>> +     This is an email for reporting non-published potential vulnerabil=
ities.
>>> +     Emails sent to this address are forwarded to the Yocto Project Se=
curity
>>> +     Team members.
>>>   =20
>>
>> Matches what Michael said on the ML, so I guess
>>
>> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> Please also backport wherever appropriate (maybe we should think about
>> having this under the same mechanism we use for migration manuals so
>> it's never outdated even in old release manuals?).
>=20
> I think the idea is good.
>=20
> One tricky point is that this is part of the development manual which has=
 been
> split in multiple documents not so long ago, so it wouldn't apply to old
> releases =E2=86=92 maybe we should move this out of the development manua=
l and make it a

We can still try to figure out a way to have this similarly implemented=20
for older but still supported releases?

> distinct (and more visible) section? What do you think? This is about sec=
urity,
> not really a development task.
>=20

Yes to making it more visible since I assume we want people to not have=20
to look too hard on how to report security issues otherwise we may=20
either not receive reports or having them reported on the wrong channels.

I guess we can have it amongst the Introduction and Overview section in=20
the navigation panel on the left?

I think we should probably add a new section where we say that these=20
instructions may be outdated and you should really be double-checking=20
against the latest version of this security document (and maybe link to=20
e.g. docs.yoctoproject.org/dev/security-whatever)? If we ever change the=20
process, we wouldn't want people to misreport because they read the old=20
version of the instructions?

Cheers,
Quentin

