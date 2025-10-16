Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327B0CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:21:02 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.64])
 by mx.groups.io with SMTP id smtpd.web10.4592.1760610058763237122
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 03:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fia+4KWc;
 spf=pass (domain: cherry.de, ip: 52.101.70.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGhGuRUzz6GZqlYogbzReylqQpuo8VabQnmYrIG0gKuFmtrVbyMdOV6I6MpqIzAu1TLPFEOAwfIyQuq3pC7fl7/L73HtSN1UrzDqaUlLvoygR473YAhF8DPEy/oFYIAbWDA0J7YkjTfmaMeAqKdbrl1WGoDhoG9kTwXX5SBabstqEKIl/GCghApXf9G/6VAWlFrlyU0vnWInRowFFWFhfmwbaBoHRI4oKbCv9cOwREKla8fjYG+diOXmY3vkv0p1joNlW6qM6Ew3sjgBXRSDAuJgXZCNTtpkX8poOl+psqA51j15ALyAJYJ+FM5nBw/Zpd+mo9f/MAzUVoK0Iy8l6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQiMF9uBM5JhkM6rYWd8XccERDmer/Tab1mxUMnWWok=;
 b=xXDADrpGEXdwrgOWCCd92pEnFTDCWJRT0UimH/frX5aMmhCD1T8Lm0MGUIkRGluv0AlRzXGWBsLSglFmfz8c/3b+ttd56wRqKS9JLZ3g2vZKPCNHLHEuSDXoUC6UfYnNoqg5SkPAjBpZjKKvBxzRsNO62aOLD5XH1CbSz10lb67zvSAkNHpcnBh0UMHT+G9V9emm4P1GghqdOH9SrSoNfqGeGEg/FlvphcfSdY50lRkkp1FsE7Yiw2vN4fW9TibO1CiKYvXPWKMIcdx1K8vJdYx02P/qLLfnSjqL4U1F/puUswSWAMvLTi/uTakVDaarU/etYLu42VyxSUGQ+f8egg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQiMF9uBM5JhkM6rYWd8XccERDmer/Tab1mxUMnWWok=;
 b=fia+4KWcqjivg4aQAHKhCRrWyiuh2XQGv1718DbgzcbUOghuYn81BzKJYRUJAKOAVCdVdEegWmKqtq8R1TmfhMJ05gLZQWwAKJ14oKn5CuOENjxondnDBUDQ/eLlFPz7Etkn71k9RIjMqRN0LGPkzBhUzxsfLaSjnJV4cnvwU8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7752.eurprd04.prod.outlook.com (2603:10a6:20b:288::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Thu, 16 Oct
 2025 10:20:55 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 10:20:55 +0000
Message-ID: <f47a2194-df43-40bd-b5e4-63f1281da138@cherry.de>
Date: Thu, 16 Oct 2025 12:20:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 09/17] ref-manual/variables.rst: document the
 REQUIRED_IMAGE_FEATURES variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
 <20251016-release-note-5-3-second-hunk-v1-9-20f21db1f93c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-9-20f21db1f93c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb635d9-2886-481d-9eb7-08de0c9db086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QUwyVDBhcURPT0ZnOGdvL1psWWZ3NVhXMkUydm9lQ3NqeG96dzRTRGRzTUlN?=
 =?utf-8?B?VmNJM09pNzRXN1NZMlZudVNWdzB5UkdKSUVLZ1oxaGxqcWt5aU5nbzI5eDNJ?=
 =?utf-8?B?TlYzdkFzWkh5TTB6MU1pVXpnOXA4a0xqNUNBQmt4TkNlcWJKeFJ5Um1rZWsx?=
 =?utf-8?B?SUlSMzFVOGFjMXFWV2docDhueGw0SDJINVZ1NnJSN2QxMENzK1RVbk1iN29L?=
 =?utf-8?B?OUtqU2x1blV4eVBOZm1TNEFqSlZMZDQwekwxU2p5aXhEVDYyZ2N2bUt4THAv?=
 =?utf-8?B?MGFKTEtaWVd5RWh3Zkc5Rm92bVVyWmpHYm5rL0VQTmpSSUFhTHdXSThmNkpQ?=
 =?utf-8?B?aHhPbDNIUVFjZlpFRkMyakJkZ3ExRXIrRitpM3BoTUtySDRBRFBIVTJmQitO?=
 =?utf-8?B?eHdBWGFDaEw0VXR6UkpTQ1NGQVgycmlvQUF6R2M2ZXlRR1pBZ3F3eEdWYmpW?=
 =?utf-8?B?blJQNnpmdVptN1lVYlhrY1JOdmtnOFJycXRCY0Q3NFBoS3FSUDZXbnIwU2dI?=
 =?utf-8?B?N01kd2Q2SmtkczNNRjF3dGc1bVhJQUJ2T2F4aFF0Smt2VGFRcU83Z0V4bVlp?=
 =?utf-8?B?dTBGS21RcDExMURzY05DdERaZ2FUUlUwZDJENjNZUkZsaERkOENrYXVZb3NU?=
 =?utf-8?B?UDNrWFRoYXhrSE9Xa1dKZ0FLT2hwZ3gvaThTRWR5aFE2d2x5eFI5N1VDOEMy?=
 =?utf-8?B?OVNVNDR5ZnVidnpiV1dCdUllWEFQY2RjQlhzdzVuWmtmYWt4U1pSVVRkQUpa?=
 =?utf-8?B?ejJsNE9QbnNnanJBWW9OUlpqT2hFOEVLN0pxTlRGazlxb0h3Z1p6L0RnZUJx?=
 =?utf-8?B?VUZQVDdvTXBIcFdmU3MzRmMvT2k4Z2YrUDJRZ1B1bUVFUk8wank2SkdYUjlL?=
 =?utf-8?B?ZXVjdGhiS29XUlcycmpnaENaeHhqLzNCNXY5MUJveG9nWU5CbE9NTVNNd1U0?=
 =?utf-8?B?WktxSXBUR3ZteFVvMlFRdC8xOEVkYVlHTjJjTUhEMStiNlJSSmFtMUJWSXR1?=
 =?utf-8?B?UDFkYjF5bkZjZ2g5RzJDSlg2WFl1eFFUVitrNFdYYlhMS2w3VlVBRjNaZnl4?=
 =?utf-8?B?ZUQxQU82a0pxZENZb3lsTXYxUTJuOU51eHorbFh3YjhaN3dvajdyV21SbW9p?=
 =?utf-8?B?UGxvMWp4NWFZM2NFK3pNeVlvMk1BbW9zeS9KTzFCRUNJc3JLOVV4RGJNaGdt?=
 =?utf-8?B?YmVxK2FLQVllbmE3THorM0hBZnBIMjZEVzI3OWpkRjZPMmxTK0JvWVc2d1RB?=
 =?utf-8?B?Q215MGFFOHlLOHlWSnZXL0JzU1loL2lwOHM1bk1WWTVUeUF2RVZ6UTNtU2pB?=
 =?utf-8?B?VU9OcWdrTFJkTkdYampoTERoN054VEdpTzVKaXNHVXpiTjZnSExzdW9NWi9S?=
 =?utf-8?B?VkpZelJacjM5bE11QytHZnhlUXdKRi9LeVpQN3dpM2dLK2s3ajE3aVJOazRr?=
 =?utf-8?B?ZUtiZE9NMERuZjVMSEcveWNHRit4bDVDSm9ZWVVTb2E2cjV4Wm1wTWNaQWdt?=
 =?utf-8?B?SGlYSzQ5TC9HM2ZscDJDd0Y0QU1MKzBBYVVFR3pJbkJkRHFMT0NaeDhXU2d1?=
 =?utf-8?B?RG96aWpZK284dTNUTFk2c2VSVmtuYlArTlZsU1M3ZnJTTVVPd2c1WTlHZm83?=
 =?utf-8?B?eHpPQlJSSnFjNEZJbld5M0RBRnZLck0zeUlNRjJnZWhhSVFmSHBkRHl1N0hU?=
 =?utf-8?B?c201dTMxRWJXV3NsaDRFMmN1aGhpWTJ3Rk1RbXZEdWFUbVpqRVJHVVhjei82?=
 =?utf-8?B?UHpBVEVZclJrdWVTd3FEQmxDRDduRGRob25ycjltM2ZKckZJUHZFNHd4ckRR?=
 =?utf-8?B?WHBZclcyOGtWdC9GRmxHcTg5K0JPTDMrWTNqQkZ2ZWRwbFNEWmUzWXJFU2wz?=
 =?utf-8?B?ZjI3TGVGbHpMckZMUGE5UWNTUll4OHEvUWE2N2lPbTdCQnVDZEMyR09JUSt5?=
 =?utf-8?Q?0/wZ9ohZu0AoMI5RVvUTce0B6EQweU2p?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cy9UOTRSeVhMRjNaYmI2YVNUdkVDQkNhUUQ4RVAvUzVyTVhreDZJV0cxVDNk?=
 =?utf-8?B?V0FrcHFTeFVDeWZ3QjhSSTlhazVuMnlyUlNNVVpZVXJGZjFuTjNrV3pOZVdp?=
 =?utf-8?B?dTd5NUNyQWtwam1BT2xYckN1S0pmR2ZZcXBvSkJPOEdydXIvVG9oRVIzelN6?=
 =?utf-8?B?VmI1NDQvWHNYVFpBM1FOUkJQdmx0Zk1pbHJNMDBPTjcrRzJqZmRFWkFLL2dm?=
 =?utf-8?B?QjhOdXM1MW53SC95YlQ2RkhZY0ZXTmJTMlBXRFpuSUVyS0ZjV2FUNnZ2S1FS?=
 =?utf-8?B?MVVNTXJIWldaL1BaeHJtY2t5ZTgwdWtZQUVMVThRci9NMzJ4VjJRc09sejdo?=
 =?utf-8?B?M3hJd3IzSnBVNkQwNEN1VnJvZUxiSGJRQVhsZFpXOFRxNERXdW5GK1lnZ2ov?=
 =?utf-8?B?MGxSNlAreFREN2NXOVdiNXh6bTNwOUdlWXN4WVdqOFBMNFNTWEVTcllaZExr?=
 =?utf-8?B?ejhHODJaWWpTRUpnQjVFTFlsWkg5K2NzbDRQbEowdnJKZFZOK2FXcllmVlNr?=
 =?utf-8?B?Rm1FRnNJdHJFRWNReGVlZklwZW95N0FVVzA3N05XWFdFMU92bCtnM1RjYTNU?=
 =?utf-8?B?SHBvR2VHT0g0TUZpZWxaQ3JjQmtlRmNmNW95emJFUm1KN0xoZDJXR1FOaEJL?=
 =?utf-8?B?TnltQm1uTlRoU1dsYlQxU1NVcmtsVEkrRzRmblZ0elF1QzFCWHNYd1o0OEx2?=
 =?utf-8?B?SnFtc0hhSTU1YktaSm9mUVcyRy9jNXp1NlNFbFFnblNLU0RMeVpXM3VKWlNh?=
 =?utf-8?B?SGV3WlJCc1U1N0lnNkFsWnhiVUNDTHlxRTZKK1dBNlQyRmpwbldYOEdsbzA4?=
 =?utf-8?B?enhPaXR0SzVRWTd0ZlRIQ3ZUdXZoemtheThWRXRnZXhFUWdHYk0rQ2xNU1hN?=
 =?utf-8?B?TFZVa2VncHRveStidWdYUEh4QTVIT3B5K1RTM2VRSTV4d2F1SXNjTnBDdnVx?=
 =?utf-8?B?VkdPSVBiY20vMlZSWjVBaFJuNUhRaHhYalFWOFBJblFST2YwRjF3NFU4OXIy?=
 =?utf-8?B?SVhnWEI4ZzhzeGFHMERTZHFvSXhMcFlUZDJHZ0hXTE16NGZwTWpBWHlsdEFQ?=
 =?utf-8?B?WE9Wa3JCbmlIWHByMU5hdm85d2JZeEc4ZHV5NnJmc0FlaldiNm4wTFlOUGZt?=
 =?utf-8?B?QzlpWVZoWEU1MTRySFZyQWFoWXZhY1JVaE1Oa3czWjJIMVQvRXZuS0Yvd01j?=
 =?utf-8?B?Tk1JYys0MzVQNnRSY3BMQkJtNjhWWmQvRm1zaUsrODBvQVIrcTVSM2U2c1Zn?=
 =?utf-8?B?Zkk4NitrZHRjcVhnekhnR3RyeUFFZTZDZVJsSy92WVdRRU5oOXE0ODdCNWkz?=
 =?utf-8?B?MFNMNWVJbVhMREVmajNxVEFZL3VqV0JSVXNwNzdCaWRFUUJQeGNDb3BXSFBj?=
 =?utf-8?B?OTRSUjNRVmdYWHN2cTRtdzlUQ2tnaVpSWU41QVdJdFg5UHZuR2lKdVpHSVhl?=
 =?utf-8?B?SzhyclgvcDdXRWkzTHJBZlc5VWh4eC9pbWMxVWpMdnZpRm8rVi9iQVpQS0pp?=
 =?utf-8?B?OGRxQVc2V29rS1VTS1hMVURObUJCMWhXWk0vZGgzcW5Ta3VkYkhzYkZKckI2?=
 =?utf-8?B?WENlQitYVFdtbExaRVYvS3lpdnc2aXN3Qm9rZEF0YnpqM2VsNTREMW5OaWJs?=
 =?utf-8?B?dzhqS0FqWEFZUWgvWDhkVW0zZTAxL3lXdjdtK3lBZkh5RVp1eUpJL0gyMDla?=
 =?utf-8?B?bTMrdi9tWEtNbENsQ0NCZVh2RE9GL1AvRmNNd1E5eXpFM1FJK1NlbGw4ditK?=
 =?utf-8?B?eGg3ajVMRWxoUlBlaGRUbG5zczVBNDlaOHJaQjNjdVFUS1JyNHhheTdmSEZH?=
 =?utf-8?B?S1M0b2x0SUYzd1FyVmRvQU43dStKL2FwVW1lVWRSRjRNWmRpSU8wcDBNS3Fy?=
 =?utf-8?B?dFBiSDVPVHJIRGtuRHJ0dndiaXRhcjRENGdSRjlPTjBWc3I3d3YrbG5ZeURH?=
 =?utf-8?B?SnVwNkFTSFFlVUxBOWNiVUJmZDUzc2swb2VtWjc4TUV3NUNuRmJROHNvUFVq?=
 =?utf-8?B?bFI2T2NrQTlvdUoyTFBzYVpQT3Y2ZVBGWHhMQjF1VG1ZMFVub2RMbTV6UHU0?=
 =?utf-8?B?VUdiSGFWSXhORlVEQk1ZTytWRnhBQ3g1SDV5RkZYeENoQW12azlwWnREbUJC?=
 =?utf-8?B?WDhRd1JJMC94SzAzR0N5TEZUR0g3cGVJbzZ2UTh3YWp1c3lpYkFqdzVVYmZT?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb635d9-2886-481d-9eb7-08de0c9db086
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 10:20:54.9510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIC/5gG6koXNWN7kVKRxwUT2LO0U4MCAdKV8auLQfAdE+XoEAhVLCLkI0woJ0hQ1FHmoSfzgug/UOYkPICttIOszS9trzJ8L9zUEAeJHS+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7752
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 10:21:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7733

Hi Antonin,

On 10/16/25 10:53 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Added by commit 96a9702a24a7 ("distro_features_check: expand with
> IMAGE_FEATURES") in OE-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 6c94b0d10..bb24f2583 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7946,6 +7946,15 @@ system and gives an overview of their function and contents.
>         the recipe will be skipped, and if the build system attempts to build
>         the recipe then an error will be triggered.
>   
> +   :term:`REQUIRED_IMAGE_FEATURES`
> +      When inheriting the :ref:`ref-classes-features_check` class, this variable
> +      identifies image features that must exist in the current
> +      configuration in order for the :term:`OpenEmbedded Build System` to build
> +      the recipe. In other words, if the :term:`REQUIRED_IMAGE_FEATURES` variable
> +      lists a feature that does not appear in :term:`IMAGE_FEATURES` within the
> +      current configuration, then the recipe will be skipped, and if the build
> +      system attempts to build the recipe then an error will be triggered.
> +

Compared to the other REQUIRED_.*_FEATURES, I think this one 
specifically targets image recipes no (as IMAGE_FEATURES is to be set at 
the image recipe or distro conf level?)?

What do you think about adding a few words on that maybe?

E.g. I won't be able to skip a package recipe if it has 
REQUIRED_IMAGE_FEATURES set to X and the image recipe that will pull 
this package recipe as part of its dependency tree sets IMAGE_FEATURES 
to not contain X? It however can work if IMAGE_FEATURES is set from a 
conf context (e.g. via a distro to have consistency between image 
recipes with the same distro, useful e.g. for using security features by 
default) but you likely shouldn't be using this variable in a package 
recipe no?

Otherwise looks good to me,
Cheers,
Quentin

