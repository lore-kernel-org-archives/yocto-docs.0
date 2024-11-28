Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C24D690F0
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 10:07:36 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.63])
 by mx.groups.io with SMTP id smtpd.web11.91793.1732788450941312501
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Nov 2024 02:07:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=isF0s3Mw;
 spf=pass (domain: cherry.de, ip: 40.107.103.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWWVoj0cH7cMlRQG2cZ0MwrKl0EFq4Mh7efgqlqq3iuwujtCw3GkovgAx4XX+qsdkZIabJnlVgTND0DRm4jm3bVKhs2Ynvb+KXK3bcnnMQO+K8oVaz3CI6OUiz+x1f8RK8HKMiT2MVek+iYWcndjTQg/plZ/WQEXjZsNL/ueWGZJOKwTHfX174LbvU4N1/5hPEQKodJ6/mSgz4htAucJaQDBuVHrdwimEA5puUeDyxGtYFnUk5JirkAQVjDnc52WQyHCFBKH4nX/cY/Ld7FiIhIWndP9V8BAIqiTNoSzILZxaQLldJrQwprN4C4sCyp1p+7wzbXoh6pF4+4zCSESbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cXrszcIKE3vfL1sowf4aZeXCBIu1gIiMoZjHfA/WfA=;
 b=tlxVd1JMY+IDfJbKAGGIOy1yz4+NOqbmBcXDCvQsEwsTWoLCVUbtW3Le1JBxtgcjGm+ybHXvyb1AX7hLyak9APtebPNUFBLK0EEt10wTwsq+JP/YSekgdd7c7jA9VKfHjD0OmsDrYEepLF6hAlSJRknCs3S9C923xmEoL3Mt4gUFGJ3rgEc2LnqRA3t182GRRZ96DQEiFzJytEMzlDqOFdExujuTZKLYESjF+gRU3lTe3RvShO2kDlKRRdL3MBT2fL7XirSVRcFxI8iH/z7kTQbzC9cTKlZs57CMF/3jpQdR2hBzc9TGIXrh4Li5BxUZha9fHxa99GeRVs8daBp3HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cXrszcIKE3vfL1sowf4aZeXCBIu1gIiMoZjHfA/WfA=;
 b=isF0s3Mwj7DnWO9qPQt6iTSc/Qj/h8Xt3i/uc45Qt8OFa05wirJHxfPmYVz9hL2txETFVyVNRiXmh+PNmn2+Lk3FN5M4asXCk9+DRLG+v0+tzDkPQ9MECU2u1eI2HF+pbgpQKDXtHTAXUarccGUl3C7A+t5+AZ+LBXF/T26/FZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9891.eurprd04.prod.outlook.com (2603:10a6:10:4c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Thu, 28 Nov
 2024 10:07:25 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 10:07:25 +0000
Message-ID: <760a8cf6-a54c-4046-81c4-de3616451d88@cherry.de>
Date: Thu, 28 Nov 2024 11:07:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs][PATCH v4] ref-manual: classes: fix bin_package
 description
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241127-fix-bin-package-v4-1-e7f7c2325dea@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241127-fix-bin-package-v4-1-e7f7c2325dea@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9891:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ec5983-14b5-48ae-3621-08dd0f947514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OTVQUzVrQ2JRd0ZsMHROaXc1cm5tNDdIanVmanZhejJiK0YrVDUzWjhPYXFU?=
 =?utf-8?B?WVFvODBITTVSQWRuMy81SC8vTGQ1WE1wbVZUdVMyanZTdTNOUmVSMXlobUc0?=
 =?utf-8?B?UmhKZTNJQ2QzZWtvaDVHQWFlT2NPZXZhZ2RUQy9DTUFEaWdwWXRDWk5MaEQ5?=
 =?utf-8?B?Y1ZJUWV1Q3J1UUNtNy93M0R0cEMxakIrL3JFT05DcDJUeG80RFJFL0lsRnNj?=
 =?utf-8?B?S3FOSFJxdjBDOG94eEFON09Pb28vdGNSb0wzdTBGWnNPNDh3a1I5dHQ4RGEw?=
 =?utf-8?B?NzZCamNLMUpjYWtsVm5PQzhwRDlUZ2pEaENWMFFEMlArTTBPUFZVajNXRDg0?=
 =?utf-8?B?UFhacmJLUW1QUlZlQVBLalMvdHNEMGZWL1FYanhtc2kwRG5NcEtPN0V3TzBn?=
 =?utf-8?B?RWZ3eGloQU0rbUNWMzQzMHhqb2didGRCSEZid1BtVXB0TEpUUk5zSFBXak5l?=
 =?utf-8?B?NFJzL3BUNmxUSC82Sk1UbGsxZFhmZkltWm0yRFZTVll6NWRrdGZDWHd3MTFZ?=
 =?utf-8?B?QmgydXZxLzNwK1IweWlXVFBseThNMWMwVUphTmp5Z0VhczBCYU9Yc2R4T3VB?=
 =?utf-8?B?NjF1U1FMZFF2V1JPTWhUb1NKb1ZMUFpMdUY0cU5TdnhROWpFSXJpL0lFRDMx?=
 =?utf-8?B?aUdIUFdhaTZtOFJubUovMG9kNE5QeSs2U1lWNGhrS1NXZFp6ajdrdDRkc3Ro?=
 =?utf-8?B?S3RlNmdiUHNzRTA0eWE1RnJOVEJGYWwzYmFZdzJhT2RpS01Ra200b2Z0Zjgx?=
 =?utf-8?B?L2tpL3Z2SlFUZytDMFBUeGdTZDBkNUpKUkpSeVdDVGdUZVY5RFVNZTNFZWVp?=
 =?utf-8?B?YXFxZUg5TjlzS3Z5bWtoaHFtazkwN1FSSndzdmw4WXV5NXlBWmUrblFTWTZH?=
 =?utf-8?B?MU45dWhCbWNjbkh1elZIK0tqUTcxM1NyLzZRWlYzMnFpRVgveWVKcEU5UlVP?=
 =?utf-8?B?ODlnUFhIUFdNWTBROXE0NGQyNXlNMG92dXp3NktxVU1FaWs5emRabFJEcEFs?=
 =?utf-8?B?UGh5ajlzalZhL2VnSlNRVVdua3VISTdhSzg0MVRsN29CQ3l5UTIrVlZhRE5k?=
 =?utf-8?B?c3MwSjN4WVFOUVk5REhnU2JVWXVxeTYwMVRxcnliSm9Rb3pBc0Voc3pKMGsz?=
 =?utf-8?B?MnR3WTVaQ1J1VTA5OEsySktTTWJwUk8zMTBnaWxNOFlmZ3RtTy8waFltWjVp?=
 =?utf-8?B?OWlVOG0vU3p3SDhMQlNvTVVFZDk5NUlEVHpxcm12OVpEYUtkMWJrWDVXdFRO?=
 =?utf-8?B?Yi9LQUw0NzFjaW1nd05xTkZRVXp2V3pwQVBvMmVQV0RLdUpXQTJ6QjJta09Q?=
 =?utf-8?B?N0QrNXVyZnFwYW1vTlVnZmhTN0p3cldFYStzNjZqeHpQT1E0SFVVNlVFK3pU?=
 =?utf-8?B?YWt4QVl6NXh4SXFNSjJTZXhZUUc5ZzhEcURiNGNyU1VHQUJOdTR5RDJVTkwx?=
 =?utf-8?B?TlRTMkZxbG9QRGRPc0hsM3JOWDdES2J5M2ZnNEJYS2FSTUlrdlhaRlBneGl0?=
 =?utf-8?B?amJ5Tm1NbWtDMktaREdUMndLaEM3NGNPK3BRaTVqMjZ6T2szVlVlRjNhekVt?=
 =?utf-8?B?UmkwSVFYdEI1by9XZ0hGVVdWTFQ2TTl5blRpUnl3aVNOMUFUMjVZVDd6RUhV?=
 =?utf-8?B?cmJUKzFvYmthazJzZGlBNWdHNy8yNEp0d0kydjdtYTZIOGcyVHhma09CeCta?=
 =?utf-8?B?OG9OUGtKQXVRL2dyNWdlQ085NmdrcTVFNkZhL24wVTlkOU4vcXBsODBEbGVa?=
 =?utf-8?Q?J3sCGKXQWu9e2xHXtE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y1RJNTVVTDE4cWtzMFYzbjRSdTczVGI2Y1hMMmJxMDFPSGFZK2V0SVBkYmFm?=
 =?utf-8?B?M1o4MlJmMmw0dU51c2xuUDdJYXZ5ZlgvbU9ZZEp4cE9iNEo3eHRtN3NsSWdZ?=
 =?utf-8?B?dGZoTHczZmtJN2laa2tjWVlTZkhFYTU4MnlXZ0s0aGI0Ry8vMGIxaU1pQ2xK?=
 =?utf-8?B?LzJ4VzgxaHpBL21Qei9iOHAxeDRHYi9mOUcxSVd6eFdHS2JSbUQvOEVucmFT?=
 =?utf-8?B?NDlwUVQvd2hPTytoUkE3cWNDNWVkdlpHSlpUcEVqY3FiQ1pWbUhzcnl0a09Z?=
 =?utf-8?B?WkdwSkRENFlqTlpzTnFFZys1RmU3a2dSMHFid2svKzcyTm5hKzB5bXk2ZUVh?=
 =?utf-8?B?VFB3QUFaL3VoSTQ2LzRjQVZ1STREYThtU2ZOMGVJOStBNitpbnViejQwa3VX?=
 =?utf-8?B?aXpsbU1UNHdlUkRUbCs5OUFUN0t4MXAvWXpUOG5FQldyUmlDOHNvM3VxSjhY?=
 =?utf-8?B?TUZQbEV0L2VvTXdFeUlOYmxUVzdYTEJ4SlBhSW9LSTVia1pUcTFDSW0rSkE3?=
 =?utf-8?B?cWFTMVBveVVPT1hFUjE2QVlBK0hmeU92djlHZ2M4S0NnTWFzekxDWWk5c3dS?=
 =?utf-8?B?ZXRYMzFMNXdHOWVPNEUrNXMxU3dnYVpOQWQxNWhYZWlBZTg1QmZSRmxtYlVO?=
 =?utf-8?B?ZHlZU0JrUXNnTXBoeFl1MEl6MzhNTWtMbyttbXVhdVVGMExTUm80U1FrS2Fm?=
 =?utf-8?B?b2F1djl4ejl2REdldzdXakZQbFhHdi9iR1dXYWNJQ1dZSDFlRTZhcnJYbUR1?=
 =?utf-8?B?aXM1a1VvTUZXVXdBWkJ1MEJrK1g5MVUxQXR4TTVncG1nV1NzdmFLYkt0bndK?=
 =?utf-8?B?aHhTc0plck13cmxUeG9ORURiRzRIUnBpeExlS2lBZEloNDlPcFl5NEFNMzNK?=
 =?utf-8?B?WDFaSVUxTTUvcndSbXRMZkhxdU55Z1p1K09qeXQ2Uzc5ZStzMHlvUTk2MzNF?=
 =?utf-8?B?eXhTLzhxNjJoZXNuZzFFQmhsMktKb0dtTUg3ODFnd3R6WDRLQjFHSy9ZMm9K?=
 =?utf-8?B?Z1NvR2RObTVHVDlIY21YaW1nMG5OYVFDVlA4UDExTkhReXR0VEgrb280Uzg1?=
 =?utf-8?B?S2JBRVJ6bnZrbUdac0RwUFNsTVUxR1FzOWlUMyt6S3NwUkF5V3pDL1NySzRh?=
 =?utf-8?B?anR3dWdRYWNFL0FiRTQ4SFRWL21jcExmWmlveFR3Q2wvMXF6SSt4RlR6dVo0?=
 =?utf-8?B?KzdydUZuU1hTWU8rdUl3VEJEcXdpWkdJUTRCVWlXSmxZbGx0cUhqNGtmZVR6?=
 =?utf-8?B?WTJJZGlsV2NyczB5MFBDRktIaE9XWlNRNDJ5aHpOZERqUjA2blpFT0hZMFRh?=
 =?utf-8?B?RWNDOFQyZzF6NDNoT1A5Q0lKeGJVOEVKbWllK2FkM2wwMmJROVl1VVl4bG9G?=
 =?utf-8?B?YUpvemRheVpvZDMzZ1EyeUMzRmNST2NaaktzU1BpY2Y5VzN6TVlNaXV5c0ly?=
 =?utf-8?B?VE1xamc2bVl3YkpyYUM2OWMzZHRxc1IyQ3MydDJNUk41WkZpeit4dENuL1VX?=
 =?utf-8?B?Wm5neW9YSFc1MGs1ZmM5bVl6UUFrWkkvS0RsV3ZNSVU3NXRDbHFCUSt2YnFH?=
 =?utf-8?B?WmlrNHA5MkNtVHdRTXFWOEE2Y1BqQjc3Qnh1RlpycXlhTExsdDJpcmRoUUo2?=
 =?utf-8?B?T25EUXBjS284QjNhNmY0bmRQNUs4UzVwNjIrVmZzRk1TMGlrVlc0N3M3ZEpP?=
 =?utf-8?B?OFA1cG1kY2tVVDcvVStkZThmOFNLMTNia2Z3TGw2aHgzVGlPS3RueFBIK3Jn?=
 =?utf-8?B?RXRKQkx2b1pOVTg0OHhYZXFxQjF1K1krRjA5SEZPaHBCMUk4V2ZwRGRXMlFR?=
 =?utf-8?B?MURtcmJkdXQyM09xSHQ4aWhkQVV2TU9TYm9RSEZ0VUhoYWNHcGRiTDBhTSsy?=
 =?utf-8?B?RlJtWFVGVWFpQTdvMTR3Q2hVLzE1ZkFNYVhxNFJQNUxKaW5vOTNSSjRZRUlu?=
 =?utf-8?B?QVFqaFZNM3Z1dFBNYyt5WkdQNmFCSVAzRGVWM09mT2JUNlVrbm94bU5vRHBm?=
 =?utf-8?B?RlhqKzZPemNXZjBtRmNCT0hIWExjM2JWdVJWNEZEN0RlcXI3Nm9qUHVZcENO?=
 =?utf-8?B?dHNaUlBMZWhheEpoRCtWeE1ZY1padmd0MXNaVlB5L3NRNHl3U2hRcU5iNHA1?=
 =?utf-8?B?b1BtMFhTOW52MG9MQVNWQlc5bmJvY1lnUVpTSHF4R3ZMZlRMVVByY0lFQWhB?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ec5983-14b5-48ae-3621-08dd0f947514
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 10:07:25.2646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ii2Bjhyx0xd0ycGWmbAkup/Fgcuo6VWIOk+CUw5AANlN8+OIEhNChKIVyLY2ixM6vPMECUSnVdkJEikHWZXBFutl0cM9TKxrR+IWAAjnQ0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9891
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 28 Nov 2024 10:07:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5841

Hi Antonin,

On 11/27/24 5:01 PM, Antonin Godard wrote:
> The previous bin_package description was confusing: it would instruct to
> use the git fetcher to extract the content of an RPM package using the
> `subpath` option - but that's not possible as the git fetcher can be
> used to clone a repository but not to do the extraction.
> 
> Update the description by telling what it really does and what it
> doesn't do, and by giving an HTTPS+RPM example.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v4:
> - Typos / corrections spotted by Quentin.
> - Add tarball example.
> - Link to v3: https://lore.kernel.org/r/20241127-fix-bin-package-v3-1-ee09055000ac@bootlin.com
> 
> Changes in v3:
> - Actually explain what bin_package does and what it doesn't do.
> - Link to v2: https://lore.kernel.org/r/20241120-fix-bin-package-v2-1-917a5c2745d2@bootlin.com
> 
> Changes in v2:
> - Instead of updating the example, update the description of the class
>    with a more common (and working) example usage of the class.
> - Link to v1: https://lore.kernel.org/r/20241118-fix-bin-package-v1-1-906f0148fdaa@bootlin.com
> ---
>   documentation/ref-manual/classes.rst | 45 ++++++++++++++++++++++--------------
>   1 file changed, 28 insertions(+), 17 deletions(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index b92f4e4f20ea8f702c90f4e3d29251b2461d07d0..e7a8925806e1b6ea21e251c797c83d54b7049756 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -159,27 +159,38 @@ software that includes bash-completion data.
>   ``bin_package``
>   ===============
>   
> -The :ref:`ref-classes-bin-package` class is a helper class for recipes that extract the
> -contents of a binary package (e.g. an RPM) and install those contents
> -rather than building the binary from source. The binary package is
> -extracted and new packages in the configured output package format are
> -created. Extraction and installation of proprietary binaries is a good
> -example use for this class.
> +The :ref:`ref-classes-bin-package` class is a helper class for recipes, that
> +disables the :ref:`ref-tasks-configure` and :ref:`ref-tasks-compile` tasks and
> +copies the content of the :term:`S` directory into the :term:`D` directory. This
> +is useful for installing binary packages (e.g. RPM packages) by passing the
> +package in the :term:`SRC_URI` variable and inheriting this class.
>   
> -.. note::
> +For RPMs and other packages that do not contain a subdirectory, you should set
> +the :term:`SRC_URI` option ``subdir`` to :term:`BP` so that the contents are
> +extracted to the directory expected by the default value of :term:`S`. For
> +example::
> +
> +   SRC_URI = "https://example.com/downloads/somepackage.rpm;subdir=${BP}"
> +
> +This class can also be used for tarballs. For example::
>   
> -   For RPMs and other packages that do not contain a subdirectory, you
> -   should specify an appropriate fetcher parameter to point to the
> -   subdirectory. For example, if BitBake is using the Git fetcher (``git://``),
> -   the "subpath" parameter limits the checkout to a specific subpath
> -   of the tree. Here is an example where ``${BP}`` is used so that the files
> -   are extracted into the subdirectory expected by the default value of
> -   :term:`S`::
> +   SRC_URI = "file://somepackage.tar.xz;subdir=${BP}"
>   
> -      SRC_URI = "git://example.com/downloads/somepackage.rpm;branch=main;subpath=${BP}"
> +The :ref:`ref-classes-bin-package` class will copy the extracted content of the
> +tarball from :term:`S` to :term:`D`.
> +
> +This class assumes that the content of the package as installed in :term:`S`
> +mirrors the expected layout once installed on the target, which is generally the
> +case for binary packages. For example, an RPM package for a library would
> +usually contain the ``usr/lib`` directories, and should be extracted to

s/directories/directory/ ?

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

