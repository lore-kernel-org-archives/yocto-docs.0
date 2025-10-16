Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60904CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:56:12 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.49])
 by mx.groups.io with SMTP id smtpd.web11.5380.1760612171698880068
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 03:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ll+vZa9e;
 spf=pass (domain: cherry.de, ip: 52.101.66.49, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jezr0e85/lpjFsbDHbQBxQwrK2n929CY6vU6iHEf/xXjCaaDmHcMAkZMpwhvfH239G2gq2xEUmz7VA1Kp4whpJdVM5rz8JiVdx3RgjEMh8bOfq6VFe51GXrx1IXEVuOERbwxECzvlnn4A/ht6etSDIbIH1LRmFsjdJ37hYtr/nsaZJ2kHHwrtXtE52izwE3tzr+GFTiOWlkqms/rwwwksa8XX6z0RGkqPYGsiGwRzzT3Nkhg4ZWVlMRRUaoEr+zBC0qcKvMv7a+Ie2IbUqpM/3S7dsZWwcHwkfXNLqqSoQQiQXTdKaO7Y/M0OMJu0wsCjebmonP8G13I1Z7AtgiChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ejY57pH2NdCimw8nuDO49MQB7/uGOtpjJcW8oVDRxo=;
 b=HHD7/n9Gja9S7OWyRDQirHXiGNBGbtJ8UjAbP24GFyd0YziAX4sD0MCpjhkIchwFNxlyBvPrkHWagJFp15m4Aoy2Epttab3+80L5Xly3HK1InBufp/hcsCmoU539y8/cuOfdwmw3FgxgbetErdeDLBAIuJiePt2FGlc/9IcJni0rcu4U8pEVU6rn51JuoJwYI+KMB56Krq1UFzdF64rL4zdFq06gIzpAyKkioGkLey28cQPxXrgJgoj3YeBlIs9SoYlrCEjEDdaNKFl6rhh/fOyLlzSlcX0MdwudHfCbJ4pxcpeDUvweVjItC1MnLsGTaOIEiETsyPaXUD2Rxzl5oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ejY57pH2NdCimw8nuDO49MQB7/uGOtpjJcW8oVDRxo=;
 b=Ll+vZa9eHkNLBH7gpFhpH2Jsv908Ye2vdkz/kX5GbIke2STC+c/b/TUyy2RmKODG3ylh/sX5fkn6ZpdY11WKnse5kefQUcLd5Ei+HRGBOUgQ1Qy1KYKXjdHiOXxL/Ad1cohcjgtWLgvEcPNOnoXTdgs3lwK/jYNYaci9u8rlOJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8471.eurprd04.prod.outlook.com (2603:10a6:20b:416::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 10:56:07 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 10:56:07 +0000
Message-ID: <5f983d1e-e990-4d6d-8fd3-281923ecef19@cherry.de>
Date: Thu, 16 Oct 2025 12:56:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 16/17] ref-manual: document UBOOT_MAKE_OPTS
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
 <20251016-release-note-5-3-second-hunk-v1-16-20f21db1f93c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-16-20f21db1f93c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b16245e-3d81-4456-108d-08de0ca29c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Qzc4R3pOblExdjhmZ3FoRS9kK2h3bGpQL2M2c2pvc1lrNmlvK0NVamJLNFpR?=
 =?utf-8?B?KzhLSmpsSzY3b2VrYTI0TTZyNmtodG5Ia0w0WHJtWXhoZWd2LzV6WUk5NmJD?=
 =?utf-8?B?WkV6OEZDMlpVbVlpbWJZWmFrRDgyNlJpZnViYlRUQkRESTZKbGlkc2p5MWEx?=
 =?utf-8?B?Mko0VmthWUliR0l0TlBUcTdYRTYyZzNTYUU2ZzBIaEMvMTBVL0dtRjFvVnV6?=
 =?utf-8?B?ZUNLV2NLUzZwNStmUzhhY3BYRFVLZVBEZ05zckc0a1l0SXJNSDU0ekVZRTVY?=
 =?utf-8?B?WUxPNW5UK3BnemRmT2REV3lRRWl4TmpzT0JRSVJBMGFTaWhiV0VmZk51VHJi?=
 =?utf-8?B?QUtiN3FNV25pTFJUVnNrQnhiOTFNNHl5NTM0ZXBidnZqOFQ4a3VubXZ1YUJa?=
 =?utf-8?B?Z24xK3lERk1YbVlPYTQ0bWF6alM2QjdkYTBFK0ZMN2NTdVhJL3pNWHdYOTdU?=
 =?utf-8?B?Y2hCRlB2bDFHcm9qcGNseXc5RVliY1ZZQnZZcmNwRjVvV2psK3JuYUhhSTZ3?=
 =?utf-8?B?aFdWOEFYSjRiaGZadjdZbUk3WnVWQytHdVFwc2tRMUtzTUdNRkliNEtQbExh?=
 =?utf-8?B?d2xLak5uZDJPdWNzNFNxalRSODc1YnVTc3MzN0NxRVZCellpYmZOMHpYdjAx?=
 =?utf-8?B?YmgyRzlHSE1ncWxMc2Ixb04xSUxySDB6QUUvS1ZzdnRIejhSWGxmeWs1bWFl?=
 =?utf-8?B?TitXMVBLMFlEMFhyTWplZVBNNlU2dU5CRWcyWmZXa3M4Z1l5YTJLRjhjUloz?=
 =?utf-8?B?SC9udXJpNmRaWlc4bjBMUm5kY2tIdFVtRlVxQ0I5Zkg5Z1ZyUHYrOGtFZU5P?=
 =?utf-8?B?OTF1bk9LdCtHRVVzZTlITk5RUlFYOVhjdVJNT2NRdzduUVFORDJjVVk5TmJC?=
 =?utf-8?B?RU96UWNMRjgwSzVsVFE2K3VOd09FU0ZvWXRUTk5SUU5SSHUxOFpUeEZUdmkw?=
 =?utf-8?B?Q29KYnlKWG9TTFR1YjdrOWgyNFRRdU43U1cwdndKWit6NTE5WUQ5bVE1MlUr?=
 =?utf-8?B?SWQ0MUhxdk9oWk1OdTArclFmV3dmOUdHalo5ZG1EaWVoL2pnSENyNDZWWmNk?=
 =?utf-8?B?d0JFS1FlSXpMekc4OUhSRlhTM2hhaU5mMzQ5QVRna1REZjZ1emNZUXlPS1Fk?=
 =?utf-8?B?TTVQTEVZQ0E0eTBIbG5zZ0kxQmNpWE1jTnAxRW9rNER1STVaTEJHcTBkRitl?=
 =?utf-8?B?THZjR0NlWTVSYndjM0EvVmo0WmhQZkc3ZzRxOFQyYTBYWFVtOG5wdjZzdkQ3?=
 =?utf-8?B?eS9LN29DSmJ2a2RKQ0loRGJzNTRqOHdtUWNYYXZFNjVEWS93S0JpalVqUllS?=
 =?utf-8?B?YTVNMVU3NjU3a2ZWdkt1ODJDRHk5dmdkRUQvYjNNNlIvNVh4bUNTL2MxMGE0?=
 =?utf-8?B?dFVIUGdPT1B3T0cwMXRaY0lLcHdWaHh3a3ZyTlVJWlc0bUtRRGtEdC9BeW1v?=
 =?utf-8?B?T2NOdVZFbUludXI1b3lFYlVSYno4cDMwb09kS0hsdnc5R2JCd3dvNUpEZVBS?=
 =?utf-8?B?WVhxUktVY1IxMlFlR3J5VWkzUHdrcUpGRzg0L2VZcnZ0emFpMVhsVzlVbUU3?=
 =?utf-8?B?MkNRNU0zcHB3NUZxZElrS2V5QWo0NDhqME1VaEVTYVEwUWFSbDB6STFCbWxU?=
 =?utf-8?B?dTRIdXVxYW9qYmxQb3JLeU54MU5kSW9nRVVDbmZVNFF6clhVVzB5YThKK2lQ?=
 =?utf-8?B?ZjFlNndLSEJxRVpmazlzWTE3dTlCV0pkU2IvNERPYTZSbURON0ovUkRjR3cx?=
 =?utf-8?B?eEZ6ZktzTkljQlA5S1VCNlNUa1hsSCs2Z0VaakJ2UWpaNFhvbVF6dEsxaDFq?=
 =?utf-8?B?aDRnWURVV25WM3BjZHB0UmdCcklhdHY0ekJoVEFBbXU3dTh6TkFvME5yWG8r?=
 =?utf-8?B?bTFycUdWb1FtdS9kbWIrRWQ1bEpxd2FRR1lwZGE4VktPa0hNMVRXajhFZmVv?=
 =?utf-8?Q?oKp9V79RcakD0EsiA3Uzu3ySW0qfLE/0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dWh1bEdPT1JDQnhRYm8zUzI3OXpvZHJNK2NWeEpNNmx2d0VHVS9CMnk0NUJU?=
 =?utf-8?B?S0JKb01ycXNtVE10VFFrcGFzdkRFTDVMYjFVbHBPUTVLNkU0MWhTdFJoWTRs?=
 =?utf-8?B?azlyaU9kZ3liQjU1NEhJdlQ2SjRjZHNId05Ia3paQ1hHSHdwMU5IRlhxc2dv?=
 =?utf-8?B?V0JPVTdCV1BnNzVpckRpd0tFNXB4Sm1TWjY5T3RVUGxKV1RpZGRPME9CTGk0?=
 =?utf-8?B?dW5Pem1MbW9pQW42eVB4UlhIdUFML0ExMU01SWszZ3RCeUZ2V2NWOUptYXNM?=
 =?utf-8?B?K1RCUWdjZ0lheDFZZzB6Y2F6VE01empEcEVNRlNHUVh2dWkxTTlrL1h3SGN1?=
 =?utf-8?B?TCtvTVVlQTNoOTBlS0lzVy9FYWpNdythaGtTazFHeC9nY0NkZ2lLRmRSRkhk?=
 =?utf-8?B?TllEa28wQTNjWllyREpJRjBFeHRYWnp4MFp4cDZDV3pUcFpKbHpRYnkyK1JK?=
 =?utf-8?B?dzZPU0FLVisrYmlHNXVOVDYxSmZhMndDUUd4SVJvaXp3V2V2Z3EzcVZUK2F0?=
 =?utf-8?B?NGJWQmUwT1NzNk9vTUxFSWZBT1REdHlDNWpxcEM2R3BZbXZOc1dzMlFSOGR0?=
 =?utf-8?B?eUtuRENJRUFsNnlxaEtOVWVhV1QxUStPTUwzamU4TFd4TGlYeEZOL1MzUnFJ?=
 =?utf-8?B?RHpKaWxNWkpOMVF5L0N6Q2dRd1I5Z042NUptOXlQdm1rYWw3WUY5NWtYQnFs?=
 =?utf-8?B?WjVBZ3ZTLzNkL2NIK3VPRG5pKzdHbTlack43VkJmQlRVa3VYVmQxakUzb3JD?=
 =?utf-8?B?dFRZYm4xWVo5MUZMY3BXVjBPMERUMFgwbEQvczlaWEhuUWZzZ0E3YzYrSVBL?=
 =?utf-8?B?UW85d2Y3K3dKS3diWGpmL3YxM0lyZ0dVNlJOSnZaYnlGb05kZ3hFNU8zL2I5?=
 =?utf-8?B?QmFOKzRiam5ZL1JqUnhNM1BPOTZGNHAzUXNKVDlFc0tGaFc4d3RKUFJqbTZW?=
 =?utf-8?B?bWoyL1RjaHlHejBYYTBhQm9EekUxWFlQbEtTZS9zdnB6NFkrNXVwck1lWVpK?=
 =?utf-8?B?cFFrNmNkcnBvaHdhRHdsc1EycHZUcHh2U01ZZEZFWDA4blZMSFpDeCsySHJw?=
 =?utf-8?B?bWpzNVhQMC9sZm5kVWZtWUdURWQvblJIbExFTXRtanFvdlpPMzRaZ2Z3cVMz?=
 =?utf-8?B?YkZpUFArRldjY1hoOGdwUDJvc0h4ckZ2WWFJZXZITkVzajdMaC9SNVVlVjd3?=
 =?utf-8?B?c0E3L1gvRU9xS2xyTTV0eTl4bUFGeFQyME5zSFByYktkRW1zS0JBbm0ybWF5?=
 =?utf-8?B?eUtlV2VSMDRNYW01YlhnYncvODZ5ZitkajUrQm1sS3krTzJiU3pEMkNheGVE?=
 =?utf-8?B?MHNZOFZnR2NXajcxSEpQb1p5N0lsdnRlNnVaQktQd3RTdC9NTVgwUEd0MlVU?=
 =?utf-8?B?alpiWm1XdDZsRjZPMVp1eVJVRHpYUitUa0FRTk9TUDUxR2dtNmdGd1ZxT0JV?=
 =?utf-8?B?VWFUY3piZm5Na2dHR3Z1Tm5zY0ZZekZGd3ZvWllMQThrWGNTWllublFFQ2s0?=
 =?utf-8?B?UXVFSkdQMFpFRGhWSnpUeWxna1hMUEF4V0hDdkpFK0tIS2ZSUU5VSDJQbi82?=
 =?utf-8?B?ejB6WFYzaGZKT3E3d3pwbHFUNWlmN1VJc005Ymw2TnFCazFveVhNQnVudXpz?=
 =?utf-8?B?WXRiMThZUWkvOG9WNHErWDFkaXhEbTVGN3MrQk9NZVdYSTViTzFFc1Z6bHB5?=
 =?utf-8?B?VEJJQ2VVb2EwTkhSelNTVytJZmNlL09KcFJyTnVoYlliRlczcW5ES2I4S2RK?=
 =?utf-8?B?dHBzcmFBYkhMOUwrNmhoRFpjajF6aG8xWEFrQWZHSkRoOWswMUg1UzZnUEtr?=
 =?utf-8?B?eUR2TnRmdExUbWp1MHBTTGVXMXEwK3N0MFVyNjVNL25hTkRMRndKbkMwL1JL?=
 =?utf-8?B?WWJta0NWS3BkYVdQWjU5WVpGL1VldklnLzVuUGI5d2s0UFBXWmRmb1lKc3or?=
 =?utf-8?B?V1Jsalo5NGcvenM1R0dXQ3R5ZmtnMWlZUExFQ2NlNks1aU8rd2ZvRm5CcXpu?=
 =?utf-8?B?cDNtZ0xxRHVEMmpKbXFuWGZUMjRhK1E1ZlN3dldieE1FT0xVd1dYV3l6dzdu?=
 =?utf-8?B?N0F2SFBZZ01pMXFGWnBVS25OOWhUTXkvMHZOZlZNa28wdGE2NktpVVJ3SFVz?=
 =?utf-8?B?bnN4Wi83Um1zMm1nODJJTHlNUUdpdU9XZlVScFBheExxdnM0ZTFYUkxQZzdq?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b16245e-3d81-4456-108d-08de0ca29c0a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 10:56:07.7187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FmTN53vSS59SO9cVXw5LVAB9hA4W4EM+xpMkcsxz6muCRwXYtNzGblMoEC4NaOwiSw0+o7As4tuerG17ES4YGj1XCjbQbrHKLUw/bliJvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8471
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 10:56:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7740

Hi Antonin,

On 10/16/25 10:54 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This variable was added by commit 3338330e0c46 ("u-boot: Add specifying
> make options as part the config looping") in OE-Core. Document how to
> use the option in UBOOT_CONFIG.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst   | 9 +++++++--
>   documentation/ref-manual/variables.rst | 4 ++++
>   2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 4d74563e1..c22d3b712 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3233,8 +3233,8 @@ The :ref:`ref-classes-uboot-config` class provides support for U-Boot configurat
>   a machine. Specify the machine in your recipe with configuration entries::
>   
>      UBOOT_CONFIG ??= "foo bar"
> -   UBOOT_CONFIG[foo] = "config,images,binary"
> -   UBOOT_CONFIG[bar] = "config2,images2,binary2"
> +   UBOOT_CONFIG[foo] = "config,images,binary,makeopts"
> +   UBOOT_CONFIG[bar] = "config2,images2,binary2,makeopts2"
>   
>   The above options correspond to:
>   
> @@ -3266,6 +3266,11 @@ The above options correspond to:
>      This option is not mandatory, but the value of :term:`UBOOT_BINARY` is used
>      instead and should be set.
>   
> +-  ``makeopts``: the additional options passed to ``make`` when compiling U-boot
> +   for this configuration entry. This does not replace the original value of
> +   :term:`UBOOT_MAKE_OPTS`. The options in this entry are added as additional
> +   options after :term:`UBOOT_MAKE_OPTS`.

The last two sentences are redundant, just keep the last one.

Also, it is **before** :term:`UBOOT_MAKE_OPTS`, c.f.

oe_runmake -C ${S} O=${B}/${config} ${config_make_opts} 
${UBOOT_MAKE_OPTS} ${config}
oe_runmake -C ${S} O=${B}/${config} ${config_make_opts} 
${UBOOT_MAKE_OPTS} ${UBOOT_MAKE_TARGET}

Cheers,
Quentin

