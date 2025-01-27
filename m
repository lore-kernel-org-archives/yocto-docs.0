Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F503C0218C
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 09:34:49 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.80])
 by mx.groups.io with SMTP id smtpd.web10.48242.1737970475435504034
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 01:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WAd5pSYP;
 spf=pass (domain: cherry.de, ip: 40.107.20.80, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPwcS6a/HqMwRK4WYOGaIfF8AEyRPE0nqToC4oNAGOgia1POHkT7oVn2HpskJrFFq6suIeD6BndobPPSoKXXxowyflTKqFHL617nsNOCxvFn0hb9Mlmq2n2ltHLtz9aj/Bu5mcn7oqdx5HtZamdvsjfm2S3fS0HjwDkEmKaB4IFYwtef9OKlunhZnZooXePFX8r8FEwcaFYnfXHW3+ajfUlvNaaRXh3fyJI/HzwI8MOgMe719k0ukL7UJ97KC+kA4kkPxH3+2VMhBSj4+Q6ZTduJd28hEkhUu/iCahFoc0HVqS5hHKwVtIygQKcDGLz+EuhDbTw4breBCzBnUyvfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=706ew/x7iPVIPxcPbW4Ty/qQJP8L3hyq3zWqrR0Oo0Q=;
 b=piTfWU3wokNbEq31jdezOooepZNeb5WNZA95jFiYyTspS+rYmzqm8oPTK8l5Fy7Ht4I3kFcghdvXC1Kblz/QCtzm5JB4X5kPaWII2zN1SqnfZQVCY0mgXXNAH+OuW51/xgBpivfViXPSYcal3FrT9kmntV+504iUQ9z2uJFdbdGbHXGlXKjF900VVebQKDHO3z+rH+9C4BdfRzNQem7WXt5Re710rOC3AIgWSt/5geI/h53i0/rfGo5hy63F06oZFFx1n8iA+iBA4DofsMRGDGeeZE2HO+1FvrdEY79S9hgC9V6jQwVuzA3Ot7vymlt0BV6Hws8Zj+nEOaO8OBdb3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=706ew/x7iPVIPxcPbW4Ty/qQJP8L3hyq3zWqrR0Oo0Q=;
 b=WAd5pSYPNacgFZ5/ZMYys0V6ijwNltLcsEnCzJSdG9GvQUC5qswsHl1rZvWuqF6i1Yyz9Vd2z4TIaiOUzi4omGg3ROAL/VwDTWRro5r1UHVRLAMKHnbgryhd3NnUDN8TP/pwWnMpOHgQX+gLYQm7FJurXLfZ2Q4uurDEdjZH52c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10979.eurprd04.prod.outlook.com (2603:10a6:800:277::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 09:34:28 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 09:34:28 +0000
Message-ID: <29917756-4af5-4135-a013-032e3913cc05@cherry.de>
Date: Mon, 27 Jan 2025 10:34:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs][PATCH v3] dev-manual/building: document the
 initramfs-framework recipe
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alejandro <alejandro@enedino.org>
References: <20250127-initramfs-framework-v3-1-e54d6d834c76@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250127-initramfs-framework-v3-1-e54d6d834c76@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0416.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10979:EE_
X-MS-Office365-Filtering-Correlation-Id: 1332d75e-1043-44c4-fa38-08dd3eb5cb7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V0o5TS9MeXdJMldaNE52N21WMkVPZ3FiUFdYWHA4Mlk5SUFUOXZ5Vk9zVFF3?=
 =?utf-8?B?VWEwRXBOWXplalR0Z0xhYWZBYjBBblhHT0JhaTB6SHhoSThqZFZxbENPSzd1?=
 =?utf-8?B?L2RKV2tMa2NqNGg0T0JPRkNWMVFNbUR0ZmZnVGZuSFJZL0FEenJzOGQ3N3hM?=
 =?utf-8?B?VTNvZlNRRVZodkpmaFhuc3BZM2JMQ2hzQTlYd0pzdUVPSEt5dWgvYWlzSGtx?=
 =?utf-8?B?Q0Q1NHJjYkNXQW12OXpTdmwwb1JCTUx6SkNxaFdta3JsNjF0NGlpS3g5b1Nh?=
 =?utf-8?B?RU4yV3FGb2RxV28yTlZNOW92MnB3UjlBY09iWkFjbW9PMnB5c3ExUHFlK2t1?=
 =?utf-8?B?M1d1U3VYVnNsbFltc2hHZTlRNUFWUUNjaCs5QUVrMzhpZ1NWbHB6ODZha21p?=
 =?utf-8?B?OWFNd1I5YTcyYlJwY1F1VHR6a0IvQW1qT0UrRGplNHVBcHNDbkdCdUpGVGJF?=
 =?utf-8?B?eXg0c0YyKytyK3AyQmFaWTdwRm9ha0o4RDlKN1c0WldMTkxyblFLeDNNRW9B?=
 =?utf-8?B?cTZIZW9qZVZaYmRxcjBQNlFvcER1a0ljSWJpV3RBNG5FYUNJS3oranRuKzNY?=
 =?utf-8?B?TXMrOUV1bzZYWCs3amJ2TDZRemVlMnZnc2c4Z20vc0pVNnAzNXNZK2xTMVhT?=
 =?utf-8?B?Uzl5WFdMZjZUVUd3RHlBczdjaGxzUVdZcy85R0JUb1prNkR6ZCtreUR4Z0Jq?=
 =?utf-8?B?V0s5YTF2RDlubllIVldCWUI2dXpFekliSEtMenRjQTM5MEdhOWcycWcxcy9Y?=
 =?utf-8?B?NVFuUlFvYzBIZkg4S1hUcSs4REk1UFlsanNiVWxiRXVvYlpEdVAxUWs2Q2xs?=
 =?utf-8?B?d1YxdDhjWDhxTGtFNlpDQjRIM0dNeE5ZY3hsYWZWaFVWRDFFd0srSUgrTE44?=
 =?utf-8?B?V2RNYjYvVllQb1BGSmUycnlNdU85UGU2NS9EOWx6QjM3OWRab1BUZ1VsWjVF?=
 =?utf-8?B?UTJPT1ZVRGFGcnpia3hoMWEzQ3dTeklhOVBXOGtDb3NGMXhWQ1g5QTBxNjJr?=
 =?utf-8?B?K3RXNmdhYWJEUW85SktwcnNQWDlMeCtvbTlaT1YwME1mN0tnOXkrbEhETFZS?=
 =?utf-8?B?eHVZNjBFRXdKczU0VzMvVEZyeEdhemJqR1NDc3dycVg4Sy9WR1dFbU1ObXc3?=
 =?utf-8?B?WmJWcVMwOS9TUXZIS2xIYjNrWGxVeGlrWkY2UFJJdWVmbUJZYk85RkdCSXpL?=
 =?utf-8?B?UVROMHljUmd2Sm00WUJUNXZ2MStGS0dOY0J3NExzNUJMUUpySHpzeHNibW9J?=
 =?utf-8?B?YUtBTFlFK3YxV3VORVRwUnlsajVOeVp2eWkxbjM0bUVJd0JtNGg3Z1k3bHRR?=
 =?utf-8?B?aStvbGhMTW94Ni9qaXNpWVFjMkRXbFlBWitXaFg3b1FqZlJ5ZlR4UENJRFJC?=
 =?utf-8?B?NllpV05IVWFPdHFWU2VuZTF6ZE5TNjZYdzhoR2pUWDl1aktqM1NJNm1YdWNy?=
 =?utf-8?B?UnNBdk4xS1RvNE9xSmlqUUxlN0diOGw5OFVQYXRhS21MN1ZtVTZzWjg1NGtC?=
 =?utf-8?B?WVFxM05lMzZ3RUI1K2g5NENDVU12bjZSM0p3ZGdNcFN2djI5NTRzZnRLNm15?=
 =?utf-8?B?c0kwa2F6WGRhQ2pjR20xV0xIUURySnMxbmYxSnh6TlZOZC8zc2tKN2Z6UGsw?=
 =?utf-8?B?eEphU005YXNzaVQ0ZXJ4V0dHSVhwVGcrVUV0NzZQMDVhWXZxT2swdTBOUlB6?=
 =?utf-8?B?a3h5MFRDY3NWc3ZOYjVoT0dDb3dzR2RkL1duRVQraEdqQXdtMjRYbEwrOWxp?=
 =?utf-8?B?WG1NOGhDLzRzdURhSXFGUjEvaDhXbDFUZ1RGVEZnZnEzNGVRQzloejJycGl3?=
 =?utf-8?B?dmFBMm5oa3RkMkhnbUZxc1hzaHBGQVcrbUcxUWJhaHEyTjc3OGZwWVFVNUpL?=
 =?utf-8?Q?K7ct2waQhGvSC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDlOWlJpeTlvZ3N2N1FOWTFkTExjVkM1eDlMNnFYWE5qZUJBcGRPMXRxWmtC?=
 =?utf-8?B?OENXa0dpSm1MWnlLY1pIaStOU3BqZUhnc2hFQ2NYVGdITVREN1lRa2ZBYzNW?=
 =?utf-8?B?ak5TYmpjdldFSG9ndFhFR0FyQlhQbWR1Q1RUTmx6MXNTK0hpVjhoWkM1bSty?=
 =?utf-8?B?Z2xVWE1HNGQ4MW93UURDUjk1VHNmTjJCNXpaT3pudXJYVUJPZ2NjNnBsTzA0?=
 =?utf-8?B?cWc2L1NqbFpWY3Bvb0F0L2lWTi9iM0hRQ1NjR1EwVE1QZlNJZXRlTWd1ejVh?=
 =?utf-8?B?b1JXejFabGN5U0lLd29TTS9Tb0lock1CczRYY2RQNG50SVRIK0JJTnNnWS9q?=
 =?utf-8?B?MjZMVXZXN3QyUytzVFZOdGRQNkNnK2JMbURGMkN4SHhsUG9LN0dCc09DNE5i?=
 =?utf-8?B?Z0svOVZiTUVsQ2Q5SWc1REtZdUFJL2RwczE2UG1HMGhFbytJYkk0UWt4WWds?=
 =?utf-8?B?U2toMXBiYWk3Mk5mMVBXMkNLcUZEWks1N3ZjR2UyNWFNTHFlamhHNzdEeHdv?=
 =?utf-8?B?dUtKcHNFRkxiYUcxS2ZaajVzMzhybDVxb2dwRUJSMWc2Q2M1YmIwcGZrSnBW?=
 =?utf-8?B?R0VOeGFOcm5tZDJXNmJNM1BZMkIvN1RSRkMzY3cvYnZVTitVaGhSNlJwMlJ1?=
 =?utf-8?B?QVFKVUpMT2UvbVIzcEd3UmE1eW8rQ3JiaGpUTXhoU1lnRnE0K2ZzMVhYL1pD?=
 =?utf-8?B?cUlRY29SZkxPc0FjUjNNQnBDOUNVVm5rNXFqdTFCZzBLbmREZVJwamFEYlVv?=
 =?utf-8?B?MlM5QTZWZjg2OFo2bmlRS1IvblU2OXRyaHhBOFIxSWxiZ3lyWE9HTUdFY0FQ?=
 =?utf-8?B?TWM3WlF2K1NzbklncENTWS9aWkJsV0xPVmp6WnBiWmtaZ2ZNR0R2Z3hMdEFZ?=
 =?utf-8?B?N2RiaVcyUmJyMjdXTDVkanlaNDVWcXdpdHpDWVBpVEV2RHFHaHp3ckpkbS9S?=
 =?utf-8?B?Sll1dlM0amthR3pnK1UzT05Ua0hNeExJZ0tSSnc0NFlQTmo2Ny9VRjJGMXE2?=
 =?utf-8?B?ZlowaTBsWVlmYy94MTRjcS91WjhGRzFUQk5Hcm1uVFFmbFkwczFFcnpINWlt?=
 =?utf-8?B?MFJtbFMrUStvaHVBMERxQ3RiTjZrTnpiRDdvZDBGRDVpVGJFTVRyempLVjJ1?=
 =?utf-8?B?WTdSV1FMU0RiVGJLa3AvZlNjRXRFM2krL3Rra2lSOXB0QWowYS9VUFg0eDhL?=
 =?utf-8?B?RkwvbzJBZGkvMExtMHZYTFhGQWROcnVIYStHbStDanRwV2lONXBPbDFHNkhm?=
 =?utf-8?B?S254ZkRYaVdnZzg2SzR0dWc4T1pJSmJwNGRBUXF0dCtiZGlkTWFnU0d5YVJk?=
 =?utf-8?B?T2diODhBeG5lejRwaEtzQjY2bTVsK1lGQUkvZDlPQk00QWtpMGVRNmc4OEdB?=
 =?utf-8?B?amV5ZGtJWUZGQnhHbk0xL0FNazBNa042UkZ1RXQ2ZEdrMXd5U3A5K3h4dm81?=
 =?utf-8?B?Y1ZKdXNZNGdTM04xOXZObUFDL3dUdkczK3NUVU5nM0pVWHNneGhuajh0QUlt?=
 =?utf-8?B?Mk01MXErTjY3WXdIeGtXazVuKzVMVUtSNTRpMzBucGg3cVlOd0ZreVBlREVH?=
 =?utf-8?B?NmY5aVdlWUdQOStGbmt3QUNsbkxOVFgxOEFHZS81bWpUNUpuNkZKcm1sWVBt?=
 =?utf-8?B?WU5TWXRnblA4R0ZUVzFZUjI5VGRoSFk3S3JWRmJrYUhlN004QXRLQXA2Kzd5?=
 =?utf-8?B?cGU4ZW1qSUxYSjFJdXZJcHhaR0ptdW9qdXZFcnptdnYzNU0zTzFteGVOY0w3?=
 =?utf-8?B?d2RLa3VseDFHSE83c0hIUXdMNXdxQ1EwMGUrMm9BOTJKY0FVeS8rOW84Z2Vt?=
 =?utf-8?B?ZlNuY05SeFBHeTZyVldrMjFBSFpIYmlSdGp4RnhJUk9UUnB6ci9Jbjk5S2pw?=
 =?utf-8?B?TitQallOdFQwYllIVFFNSUJ0MnIwWCsxeGptenVyL2ZxNEhsaEhZUkhaMXU3?=
 =?utf-8?B?bEMyWm9aR3lKOXBFQ2VYdEYwTUJxZVlBakdiR01NVTduS1JLKzZDdHNMUTRT?=
 =?utf-8?B?NHVXSlRMcWlzUlNtei9waUlPUGpSVWE5N25OZ0NYSmd3OWthYVVXMFlzcFdT?=
 =?utf-8?B?eVpHMkhEVXBWOGczV0hGM1hPSGJPQ0JnWitzSFJLdlBHSDB1QXZNMGlKejJ2?=
 =?utf-8?B?RkpHSHl5cm50ckc1UEZKRkRiNXFtSkhPYXpKWHREeTgxUTFQeEJIajR0N0th?=
 =?utf-8?B?aXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1332d75e-1043-44c4-fa38-08dd3eb5cb7a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 09:34:28.2535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ua9ZZmN0I8VP6QqpuNXsUPtPQt0NmmosU3l7JBzvODPQJlX5BLEkWsJd90mtq/GZmm1n3NTApdQgwETe6HKurVNiW5PUxo7WGnKnNwhvurg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10979
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 09:34:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6188

Hi Antonin,

On 1/27/25 10:18 AM, Antonin Godard via lists.yoctoproject.org wrote:
> [ YOCTO #14747 ]
> 
> Adding a initramfs is a common task, and the way oe-core offers to do so
> is by using the initramfs-framework recipe and companion modules. There
> was already documentation on adding an initramfs but the documentation
> was lacking details on this framework. Add it before the multiconfig
> section because it is a bit more important IMO.
> 
> Reported-by: Alejandro <alejandro@enedino.org>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

