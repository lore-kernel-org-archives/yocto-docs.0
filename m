Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E5DC25B75
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 09:14:13 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.112])
 by mx.groups.io with SMTP id smtpd.web11.15302.1716282844524844357
 for <docs@lists.yoctoproject.org>;
 Tue, 21 May 2024 02:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=LcfsB5kM;
 spf=pass (domain: cherry.de, ip: 40.107.13.112, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmX/iD6XJWHW/Jo15nuylfFXDEbK8X6yTVjwW1nrNCG60D5AjxNViDU7Z4ipuK3iOWbWLDOAZyytqvBtbLJ5QS3imssRAK5tTuPfcZt2bL3aWTrPK326F5BUTTw6U3qU+64rZIBBkG26dXBcIrYdMD2PDnheY8SdiCEdzlh2w/6k/KJA2byY7BWPCVBbTUuAxD7Ys+aad7U5WrjlOjbRuHik3Vg36Y2BpiHynm0InROqv7FFcf9Nm/zw/Labn6AeaOcTlnocd3zngoEwBBQ+wweTHRhTkDvwhQKEbSeCpVQCjDhN/YZIe4rk03bgzI3T6X6lNvbLvhhRFT+OQ3yfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIYVPAgY+dX7+gAmXztYmkxYBtwTmDCS8eHfinioftg=;
 b=XJgBqw+G6XKQnz7S5mDioGS8IT/HaN0L25RDXX5jaqkpTux1QWbbWsiWBvfKIrrAUn29ZYQlR4bb/z5pb6YJIP85upjlrosnketu1fGP207njeKkcQZlTxCK+1L+koNx3VgAHpIXfjr7/t7zuUB02xoKYpPi7tmB2Y8TazzefJa80oxLY2JzyDq6RjyGmKHTHPhkiHlO1Gs52IGu1m+wWQ4Ql7c5AIXuL/0JPO2AQjGuUhj4Q4obRHRF2kFhIQ6rbXz4HoWz+6r0Sv6BLCbBcENVc5UWLmPncgAwFAdzUJwWdSP1HCQGwbQpeg3xlAM+oOrh7Yy2SAXSJzVi03GC7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIYVPAgY+dX7+gAmXztYmkxYBtwTmDCS8eHfinioftg=;
 b=LcfsB5kMnw6rSLklW5RvlfzEEz+9ijUqy+BeEKD9httDYrMp2M1AFuL9Vm/UTcTWLmHOf9fnofA73SdRYPkXwc31vCzL0/c2nBBPUxU1ESmaK7sZNjSCzxK37OVHA6ltpgRLgLMi+tMsiu1Ox8r/4eup0HEi+etBbdO9Bj+2hmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25)
 by AM9PR04MB8521.eurprd04.prod.outlook.com (2603:10a6:20b:430::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 09:14:00 +0000
Received: from VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31]) by VE1PR04MB6589.eurprd04.prod.outlook.com
 ([fe80::8476:1b2f:f236:db31%6]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 09:13:59 +0000
Message-ID: <c21a8c13-98e1-41fd-8c05-d6f25023ed45@cherry.de>
Date: Tue, 21 May 2024 11:13:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto] Workaround for uid_map error on Ubuntu 24.04
To: yocto@lists.yoctoproject.org, ecordonnier@snap.com,
 Michael Opdenacker <michael.opdenacker@bootlin.com>
References: <CAHUKmYbx81srtVGCh1iyts893T7d7Sf44fgq+MTaxDSwMsXzZg@mail.gmail.com>
Content-Language: en-US
CC: docs@lists.yoctoproject.org
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAHUKmYbx81srtVGCh1iyts893T7d7Sf44fgq+MTaxDSwMsXzZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA2P291CA0044.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::20) To VE1PR04MB6589.eurprd04.prod.outlook.com
 (2603:10a6:803:128::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:EE_|AM9PR04MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f67cfb-3bef-440f-0640-08dc79765992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gt+08puY2OmN1GpCF2ihrABzDHoiBl445qNxiVXPIRALlSJ6S048p974SSrR?=
 =?us-ascii?Q?2Dw9G4u7Ot5Ut74SNesTwCe35dhgkts385iAQCqemJhiRJbSeFOr60nbbExN?=
 =?us-ascii?Q?U3wRnciIL5oMRCGSDNBVeKREZnLh2zhmLpEwvnuIuwN+DZCC1bp0oRig+wEN?=
 =?us-ascii?Q?VfAJJvT/zxwQgJWQ7VmsJYbaZY5Q851zdiJFDt8PlQ5sYleOXY0emtIwc2N8?=
 =?us-ascii?Q?uBWkgeRq8QauKeLtHHbTnOIfRmxtJiyHL7SEp6U2D3CfanyIeTfS9OuYsCl1?=
 =?us-ascii?Q?aYUzO2OQI/1vpwqV4Ii33DJZyQNzCDZHJ+alax4KZQM7X3YFOoVG8te0PCzZ?=
 =?us-ascii?Q?izUGokhS14HaiocmE6ObRkvJbGMHro8i0hLeeoCC0qIwsECOHEIF9wV4GDwU?=
 =?us-ascii?Q?Bo21dJaaX9/pn1gTFiUcrXAcImcT5azDVmNaiTzN+l8ZxgcvpYAoyqh1z6Rv?=
 =?us-ascii?Q?UJXEyttzaIN59EOohY9qooXxdmvjfzwBdYrMCXfMnC72DRriOteOrgdFDrd9?=
 =?us-ascii?Q?NSiMNKnBwDYBQ69goiD0c8PwcyXCW0xe6CQ5oY/5GBvsRJoCGmUUUmxk2uH3?=
 =?us-ascii?Q?FKGaG9iCpEC0/LLFZwm9D00/hD8lCdzwHwv5QPZS+eiWMQELk9IUN/OzSeRI?=
 =?us-ascii?Q?I+WlWfEWvFVL90EbpxGuNkrWx2HMWTy2+I+K4atzGxHdjmlquq1SK6cYCJO6?=
 =?us-ascii?Q?A0C6rRcn0XA4jSeHW7uJSuRJYTLXy8feD2cTYr6YHTt/IPjel/yE9oKUTOSA?=
 =?us-ascii?Q?kJDidtlukPgPIeTOklcM3qav8TtIZo4EmF6Fx1XaRbFba25zc7GvSlH5Z/tf?=
 =?us-ascii?Q?x1RL7UcesYf0B6Xh+Q5Q28wFLuqAdU5XgZEQ8HZMpFyHOyTOKudfl/+o0a3r?=
 =?us-ascii?Q?Ka6qxr4j8qnVTftA02fhC9zN2EfJ6b2pYDYH9GyZWRjaPRhTwnykcQnXMc4J?=
 =?us-ascii?Q?rxAJ3v12DdBxyyTrfASx+JqtCDwBCLChgfPcywpSjQUQjanV+adfAZic+Tzt?=
 =?us-ascii?Q?ly3mRG6N55hXfoVAzjjJHU3Hcb8t4abfbdu4KGDgqUsOx/MlF0xMpt5UfxOT?=
 =?us-ascii?Q?PbfYf8woyh2KldU9bFxUgQLNCyMPX/NkNB4JD+qWGkyn518Nw+BxAhcEXonh?=
 =?us-ascii?Q?OpeRdxGfiuQer7JXNkquq1lpwsRaRATpOvxwZEI1nMq7Af76OKSfhbs0nfm2?=
 =?us-ascii?Q?+U1vfRcwxxtXsdKv5Eo5Rfqk+19f1S66lu+gPuNMKOXGqr3wAIQZv2S5Urs?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6589.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PCvo5bUZdvNp1AQSAS04p8dMJQRaUsw+6A7xUDu7P5//ApJWSWXoQGJBWPK5?=
 =?us-ascii?Q?HjeUksluXXfiKxkTHoixn2sG05LjahnESKEpIN+R5pFkovSYF4PzwrT+wSLh?=
 =?us-ascii?Q?iYsDqqtQPmFtctNklf5ZhY362EHa067ENQ6x6ZVfrhX8gAtZVtCzLG49sQwz?=
 =?us-ascii?Q?S3QRKI4XD9PyChODm5/Hb2fBoUGwnkKwpeA3M6p17EPTakT3QPaMYKufmdHr?=
 =?us-ascii?Q?DAIDCff9Y/0av8CocBcmlQsZCht669WuFAS51zfNjzAaNW71MNY708F/PUzF?=
 =?us-ascii?Q?QiaC1yhlUwX8ls4/klJ6fWvddgSBkD2L1o/29zWSdQhPm89I4TRrZehZEFh0?=
 =?us-ascii?Q?5cDo0X1bQF67mA0z1XPbHJgLRAp6qxiRnGXTi+nZ7/TDkp5voHId9942D16p?=
 =?us-ascii?Q?4pksAnM3FbBGAeAYstaL69sG8WDSSBXW8iwcgZhY3HBLGLdsJzhRlVSVWSZ9?=
 =?us-ascii?Q?zABL97NNjFfMG81KzIz9XlMJhhhRTk6qpZklqTuGuCn0pip38daNP7XZRNNP?=
 =?us-ascii?Q?+nalUXHV4s6cS+3OapR7I+QkW/yrN+GXISBDhAWfRRLSwWh5WLt0BbN8rbTX?=
 =?us-ascii?Q?sOJKp2rV0Cu+BQfRWr5yyENhP1KlD0yslgP+7zwctX/fU9PLUUTanDc/Y/H8?=
 =?us-ascii?Q?3Be5NwoUs9avsImL08xK1kaKudscWyc0dHP780vx0f++XzV2Y98KHa14/Xsm?=
 =?us-ascii?Q?mTad9rYen6nuGLH6P5U6t7zWMvo6ddcmD5BXgUsnDzktNULRV3UBJM7MyTTa?=
 =?us-ascii?Q?j6pcu9I5Q2D5APz2oQkvTdnAt5GB1eUpS/FBdazqy2mZqv6MxxwpS1xiZi6D?=
 =?us-ascii?Q?CFIOzGcmVVQNsmw13Rx4XHJXy8dpwde8z2ZPr6Y6X1dGH106rh9iwhenwTld?=
 =?us-ascii?Q?S+jFjW34cdi9oKY3+dpCARi+ZJ6EsLEMrqsZEqpHdVMlzidngZDzzQE9FCLD?=
 =?us-ascii?Q?2fHmrc+R2w+mlWDZIJHT+x4uNgu0VvhBrIAIfcAitAxCfE5rCgNQ6CmTDMQ0?=
 =?us-ascii?Q?5pTWTjGxBGh1QrLIPYUA3alUtxOXExPvRqpQrEupJ3k8JMyvdKTg2TzckImi?=
 =?us-ascii?Q?3pWLJLUW31eMOkGA6gMyzifckblRxu/KpM0rWRXEooBRoK8rYAyzRW/2nNij?=
 =?us-ascii?Q?tr72nVc3+cLO3Cad9rfcHrXZt4k+NRGP5C/f19VbSGZJ0RxXFjMTq7b5Q9cY?=
 =?us-ascii?Q?vq+EvxPjQ7imTXgrHQiwHrYiftcYB5iCGDxgYiUXsYTbnoUo68x6YrwaC6ky?=
 =?us-ascii?Q?dnclRr17LDKjTqy8RPxo/MAK+MP0kNLzBbRTs1htHGlLHJJeED2WsanZBMJ9?=
 =?us-ascii?Q?RZ0OsjT5WUShdKl5ulfs79MYPpendHciZBgyFGyVVMW20+YJW/Zz6FVQXaBM?=
 =?us-ascii?Q?AxSlnZLJBq5paGg2dMGwVyg2oAV9OHRIQOyTk7nJGxELpqkeaf0sLQhw40Dp?=
 =?us-ascii?Q?tLuAu4GXNNFJ9BFgrcOzurHeSqG/eBGfXgOBExxHoC5vwApl7JYt6lhSEoUq?=
 =?us-ascii?Q?9FXOM621c2FCY3qMSA7Qz71RGu85R9KuuyRO/Q3AQwoOdC9GsjjXvbStDfki?=
 =?us-ascii?Q?l+XSoAGsIKmmGSDIRHs8b/KmcsOiMMX0kv/zeAw90uFT01eeMvGIsFw3XLhJ?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f67cfb-3bef-440f-0640-08dc79765992
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6589.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 09:13:59.8527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGmZr14V9xfpqjgfkhmiiwmg4V5JE4sTYxn2ALU7gUiCHODK8B4zm2MyfAD6Omso59wGRne65z9kPVZXeInjVfscELb8PXwiYDPFU9UxvuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8521
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 May 2024 09:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5224

Hi =C3=89tienne,

On 5/19/24 10:34 PM, Etienne Cordonnier via lists.yoctoproject.org wrote:
> You don't often get email from ecordonnier=3Dsnap.com@lists.yoctoproject.=
org. Learn why this is important<https://aka.ms/LearnAboutSenderIdentificat=
ion>
> Hi all,
> in order to build poky on Ubuntu 24.04, I have needed this workaround to =
fix the error "Errno 1 Operation not permitted" when disable_network (from =
bitbake/lib/bb/utils.py) attempts to write to the file /proc/self/uid_map:
>=20
> $ sudo apparmor_parser -R /etc/apparmor.d/unprivileged_userns
>=20
> For details, see https://bugs.launchpad.net/ubuntu/+source/dash/+bug/2056=
555
>=20

Thanks for bringing this up. I think we should have this documented in=20
yocto-docs? So adding the mailing list in Cc

@Michael do you have some idea on how and where to integrate this? (Or=20
maybe you have some suggestion/patch ready =C3=89tienne?).

Thanks,
Quentin

