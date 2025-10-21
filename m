Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE6CCCD1A5
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 08:50:03 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.56])
 by mx.groups.io with SMTP id smtpd.web11.6798.1761036593299102899
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Oct 2025 01:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lrRHaFaH;
 spf=pass (domain: cherry.de, ip: 52.101.83.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juLzcO8eAlYvQlSmW7CH8LiIHGXUKIPDws4GOmM/nZ8OzFxuh79IPztY2O2DjuveIT8zDftReQza7+Vf3X/sdWf31rYziTyUKlzhB72NDO0IrkPz6e7Oc/YfKiwPTqNIwjC4DPJT/Nx1PPfqXDT3qFHAkR2nNDNr89CsQvlUWTm5pL3jDIbULu30OKLrFQiWyOdsRnfDtjlKjgzRTRig4b0LZI02bRXZNES76zpjzlwcbNl8qcFSADtuiQoNa+HnIaa2jLfAjA4PAxf6JDCgyww5JD9ZAKRdT+IuKKH/zgKewTKI5ixcjTefmLXjdBF83Vo5AMvQx5fTicBf3yM9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxg1R1ZBMUIqXMxb+XB+vYOvR+1yTsSMdRVjPsTPZSQ=;
 b=wlwaPL4u6Kdq7JmKF/Bhla6ZDWnjHjgZwzObF4fFhCooP7RJS1GF1fAsgmJdL7CYXCof0D0r46+c+AAEf2BE/I5kz8vgKiLtwY6b7qj1MS2A8GNUSQlboIYBcmarSJMaT9METKWjyCaqpVOWoL/7mAeK/BUpp8NWhPVoo9Hfeqyqd/k5dN8kiKk1/tL7WKznyXz/orjcYxdo/mdgEuSE4zJQQsHB8ls4tQho4pYMP/i8kTSxXMPajfyMm6ntw0JiZ7EP49f8HhqdhsHhrcS9Y9TQC14tB/gyT6Yc+IiixdUFM3Y+d7GL/XWUEIu5JajSIT9TZJ/IkJIbNGw9qNyD+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxg1R1ZBMUIqXMxb+XB+vYOvR+1yTsSMdRVjPsTPZSQ=;
 b=lrRHaFaHoqEGNaswa+Z9PTl7h2bt0l82/Azv1ddkSWYhg1HsLB7erky8A3RrY0GA80bwa44gfoymfVDQRIXLez1NrjXkQhADo3kL3zCgfzdL/VWtphFVTjDK0b+ca6+WqGDGICKd5q4553s9cM6F3MLAcSHQMILLALzf5CugWzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB8332.eurprd04.prod.outlook.com (2603:10a6:10:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 08:49:49 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 08:49:49 +0000
Message-ID: <7d15f2ff-bc28-4ae2-b797-890f1473dcef@cherry.de>
Date: Tue, 21 Oct 2025 10:49:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: cover FIT_LINUX_BIN
 variable
To: adrian.freihofer@siemens.com, docs@lists.yoctoproject.org
Cc: kavinaya@qti.qualcomm.com
References: <20251019164740.3795019-1-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251019164740.3795019-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0224.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: c930afab-27ed-480e-6cc3-08de107ecb00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VEZ4amdQT0dmeVJWZERMc0tHeDdxYVFIR2I5YVhoZUNtU1hReldOTEpvMDRG?=
 =?utf-8?B?dmFBdVhsS3dFSDhTNWJHdjNTbVhNMzRrSFNOd0VKREhnTUJjL0JmQmdpRjU3?=
 =?utf-8?B?Tk9nRjNJTmlWb3JFMXplRDJKRDVvQ0IvWm5oYW5Tb0pveldCVUF2ODROaEdY?=
 =?utf-8?B?aTBadXJXQUswSGwvbTNzY0Q5Z3R1b1R6WVR2U1piRk1leEZlcTN1SlEyN25S?=
 =?utf-8?B?RWlHRVl2aGlxbnFuODJhL1V4TlNPakdlVWhHNnhWMnlWQUJJbFhOMC9SaVdC?=
 =?utf-8?B?RkUrNkVKYk50UlcrS2MvaEdUY0Q4a0RPS1VqNVdSVzFEOEhROW8vNXFaejVp?=
 =?utf-8?B?cXRqSUE4Vm8rdGcxaDVuV0w5WndJbEtlNXBMbEE4ZHI2K2VtN2p1WVpEb1FQ?=
 =?utf-8?B?dFV2RVB3M3gybGUzWWdEejVKMGhrUWllWG5wK25WQjRIVEtjcFJCb1R5YldU?=
 =?utf-8?B?bXorS1hwVVpjZXFBbjJkcEx3SDZVaUIvUU1hR1ViRTltREdpTEt3R3k0bjNw?=
 =?utf-8?B?ZnZWb1BTMDBTcjNCOWNDZG9XdnV4ZHRZQ0R5aU1ZSStXa2N3cUk4UHE1WWhk?=
 =?utf-8?B?VVBjQXM3a1oxUjRqcVVyY0FuQzFxMXFQWWpMUERqeGdhQVJwK3NobDA1RnlQ?=
 =?utf-8?B?WjVtaDRhUjJBOU0zK09taUt1b05YNEV4VTRWaXp6QWpDYlh5VGRMLzZmRm1x?=
 =?utf-8?B?ZHF4OXJ0Y3hTSkN2VXB2SlBBWWNWcmdmay9MbWw4SFo5LzRFQ2doRE9sZWpn?=
 =?utf-8?B?cjhUamU3L0RZeUNPeHJndU5GZ3dQOXVEZVZERm1sNjM1WDNqZDJVS2dqNEx3?=
 =?utf-8?B?UDA2NU56VXVVcmRpcElZMk1xMW55SW9QdllaczZnRzVCSFR2bWltQ0xVR25y?=
 =?utf-8?B?ZUVFWDR3OWZHdkFiRExvb2Q0TFJqb1dHaWx4RTNCN0NmbnZEbldGU2R2VjdI?=
 =?utf-8?B?UmN0TkJPbDdIaVdpa0h2aW0xVEV4TGpvZExGQ0JNRit1d09KWWp3WHJOdjVr?=
 =?utf-8?B?aGVYWDhibHowc3ZQUzhldFBxNTY4RTlUNklYTloyMDlNNW1Tdi9vVlRzRGEw?=
 =?utf-8?B?T0hOb0U4eklnR3lJeTg3WXZuTUhQQWI4aCtmaWZMWWVoUGVja2pxSTZtbi81?=
 =?utf-8?B?dmFsVE5TUW96VjFUV3l5SG5tYXRmY2l2OTQwWFZEZ3ljOURmeWp6Nm1CUHpp?=
 =?utf-8?B?TGtEaXkwYURwZFJDaUlpQVRLSmVsUndXZFlDNVhBdnBBU3F4aHArRzRMbEpE?=
 =?utf-8?B?UFNKbSt6R2IwYzluMzZhaU9Xc3JMRURWVHFURW5HQ3FzdEg2Y3E5aUxxWVU4?=
 =?utf-8?B?TEVwYzZwcytMTHNNZytqNVhqcUNiVHk4Q0h0OVpmZ2QwTWhOM0VxTUdzb2pQ?=
 =?utf-8?B?djYwM3M2UCtSYTlNWVVzTFJTcmhpZExQb2lPOTRLSldBSGdUTXI0TnpVRldF?=
 =?utf-8?B?OEZiVm5sbnduSFlDTjlVL0E3cU1EZU1vbERvMzNKUk9CdHJaWDdLNHFiTlc3?=
 =?utf-8?B?Y3d6amNrcDAzWVgxeUs5Rkw3K2JpQVVyQVpQeVozVDIwcnR4ckg5UUtYeDBG?=
 =?utf-8?B?dEVoeGFGYSttNUJXM2JzWUxLVklCMGczQjBqWG9aVVpVbkdlVTRqRFFSRjNr?=
 =?utf-8?B?K290RnpsWll1czZRdjRvYS9oZVRrV0xNRzRiRmFvUWhxZmhaOHJqb2FwS3Qz?=
 =?utf-8?B?blFSMUVRZ3lucjhmamdyNk5RbEdtLzZrWUJ3NnRFanZXVmdjVk5KZHZrbCsz?=
 =?utf-8?B?Sk11UERDSGc3ZndiL2Q0N2xLMnJvTW1uaEJMUW10VGtlYXpnSlBYU0dGWmQy?=
 =?utf-8?B?TG13SXBKOTZCK0hPY3FiTlNaOXRhSlMzVDA2OU9lSHA0UGhIQUV0a3R0bDdl?=
 =?utf-8?B?aUpQL1hVNWtpY25EQ0gybFg1RHBHRWtWTEdrbERsL3kxbWZFUkZzZXpZbzFN?=
 =?utf-8?Q?k0RGHrnm/IQkJgKvN1fw8bSf0DRi1HfJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnNaSURad2dPMFZxejQxMzNrbVdIMllQMHN3OG9pakUzcE04cENWNGczZGxk?=
 =?utf-8?B?b3AwSVF1eUM3QjdRS3RHbXYrT1k5cUZHYVN6N3NvU0FSc2ZOYmVETERQVGY2?=
 =?utf-8?B?bHNqRXh0MUtyV0FJMDlFUUdGYk9DbXNYTG9TSm5vWXBOcllicnpQQkd2OVlB?=
 =?utf-8?B?eFRsM3QveE9oZm5XUlhXWFZiaUtzRkRyaVhCS0FJTDlYYU0wMFRRZDB4ZERF?=
 =?utf-8?B?S0tkalQ4U2VEQmVjUHFQM01kbE5RRVgwZHZXYXVnWkhnMm1TSDU4V1h4UVR5?=
 =?utf-8?B?U3NNVGRtYjcxRTlBVS90VlVhU0ZBUFBvTVdGbWQ1MHpMN3ZjNmt3R2E5T1g3?=
 =?utf-8?B?c2hNZy9NV3FrbytCOURWbzZKNjZ6ZlFEZUxnK1p2OE9xUEhvRENmeU5GNHVz?=
 =?utf-8?B?dGUxSFl0Y2h1ZWNsODRNUW5NWmxpS3JHbnU2eTczVUNrKzhhZ25jbEJHWHNu?=
 =?utf-8?B?dGVXWEtBTUk3MnQ4ZjRsTFE0dlNzRFUyOUVIR0FnV1g3cWlVMzFTNW5uK2lw?=
 =?utf-8?B?dGxPOGF4dm5raW9VL09XblB0aEpUc0R5bEJpS1ZxbkFZZTFPeExqZ25yZElB?=
 =?utf-8?B?dkhsLzBzSk0ybGVlbzh2SHBtM1BnMms4OXFqSGJ2eVp1cjdVMGtKUnE3bFNO?=
 =?utf-8?B?SGlWTmVBamwyaHZESStLaWZTMnNabGpiQTF6V0NKQzdMMVM5cy9ONkR3ZXM3?=
 =?utf-8?B?ZUlnaFJDak1EL3phbGdWd3hFYkY0a1BZZXRTQWlBRCtTZHFGVkhwcU5lR3Bl?=
 =?utf-8?B?THBkaHNhWnE1MVhNOHZYZDc0R3BlSklIK0JnRTV4SEtJQXh1UC9VNkNucytB?=
 =?utf-8?B?YUtKRjVYUGtSZWRJL3htVjJEZlgzSktBRzJDUkk2UXA1MVZtTDhka2o3VW5m?=
 =?utf-8?B?dkN6T0RVM2ZBWmN3UldwRzVDSUppbkhkclFaZUpmNjlqZVRVcU1QVis1TlZh?=
 =?utf-8?B?L3NkQzU0ZHlONW5SQ3c1alhOd2RiRXRTK1h4cGRtc0xLVkhObXd2Qm8wUzZj?=
 =?utf-8?B?ekpHOTlWWkNPb09OdFZSbjdCaXhYamJxa1BmcU90R3ovWmdpS1cxck9FYUJI?=
 =?utf-8?B?SnMwRTM4K3Z5YnhvdUcxQXBMMjhTZWpkTThueDdYY2p2bm9XYVJ4SVFGcEZT?=
 =?utf-8?B?ZXdOVkNwMm5GaDhQK2NVbEpGdGc4WUhtbzg0T3hSQW9xSzlwcWlJVVJadFV5?=
 =?utf-8?B?RGQ3TVpFU09BbW9MSUh5ZVI1alhMK2VqKzVKVFU1bC9veXJaVWZyZVhocEdX?=
 =?utf-8?B?T29zRFp4TUxsTEpBWkFjUUpLSHZKQlJLcVh6QnRmbFAwV1NsSVlVOHZmZ2Jh?=
 =?utf-8?B?MjdJTTdXSSs1YldCU2h2NlpTalY1ZHh3azJKWTRJZnZsOXkzNmdpSVRLMkVI?=
 =?utf-8?B?c0NOTXFtZTUxczNOWSs2b0JUSjE3Qk5vOVdzQTN5TmVpQTNyNlpvZklIY2Vw?=
 =?utf-8?B?YVZLWGpNSXFhTkh4VCtGSDRUeVBRT0FpQW9SYXNzYitVcjBvWmtwbVdIV2la?=
 =?utf-8?B?WEhOWkkwMmNCQy95RDBaTmJnK1VwSk1pV0tweDk2cXpCdC9IUjFkSnMwOEpE?=
 =?utf-8?B?akxnZUZnUGZ6WWVZMXZrVm1xTXhRaUowK1o2YWM4WFRjaDdFdjM0eGZiUms2?=
 =?utf-8?B?ZXFHcTA4VzRSUmt0Tmpsd2RTdE80QXdSRTh6WTI1Y0JRRm14aElMUFR2dTVG?=
 =?utf-8?B?L3hrVjRYMXJCNHdWY0JGTFE3QTJqQ0pZenYvNW94QWhVVTFVZ3NkY1duV3Ax?=
 =?utf-8?B?TGlSMmhNTmJVUU1aR25XSzA4bmYwaCt4TEpPK1dGemxTV3Q0d3pDS0VQU29z?=
 =?utf-8?B?azBBaUxnQlgvMWg2Y3hWSU1Nak9adEFKdWczMFZid2xlWW51dTA2MVpMUnIy?=
 =?utf-8?B?YVp4M3ovYjB3ZlRpaHdDMy9Ca0lqaFY1Uk5jaFMzZ3hIbTdPTXpFMTBCNzVk?=
 =?utf-8?B?RXAvZm8rcVh5SWs4K2IxQ0Rkd2RnWHRSL1dyeDVYTFE2UUhhTTFiQ3R2NUlx?=
 =?utf-8?B?cm1wbURlNHRwMWRDTTkwWVYyQ0lpbU1kYWRKWGlDeHlXYzVyV3ZMbVZtT1or?=
 =?utf-8?B?N3dEQzVob2gwRWFrdUxGdjljYTNnOS9ZdFc5TkJSYUtKVUpVNTV5Vk41V2Zu?=
 =?utf-8?B?ZG9yalFyZXl1bFRoMDNEcmdLQnJjcDFZWVZ5RllwT1Y0ejhVWlgvSWtRT3E2?=
 =?utf-8?B?akE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c930afab-27ed-480e-6cc3-08de107ecb00
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 08:49:49.2583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dL2fAZIN1hHPEMeMKMt5iDAOppGpoCplE/W0BzqZBk3noEWA5IZuLeVnIrtDP7e6V9im/R4TPA8Z4SmZcq6ZFSJ6kLKrZdXQp1vxKgLY9go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8332
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Oct 2025 08:50:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7763

Hi Adrian,

On 10/19/25 6:47 PM, Adrian Freihofer via lists.yoctoproject.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> Document the FIT_LINUX_BIN variable used in the fit-image class to specify
> the kernel binary name included in the FIT image.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   documentation/ref-manual/variables.rst | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 591c03028ce..8a10dfc54e6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3430,6 +3430,18 @@ system and gives an overview of their function and contents.
>         The default value is set to "x509" by the
>         :ref:`ref-classes-kernel-fit-image` class.
>   
> +   :term:`FIT_LINUX_BIN`
> +      This variable is used in the :ref:`ref-classes-kernel-fit-image` class to
> +      specify the name of the Linux kernel binary which gets included in the
> +      FIT image.

That is not true.

> +      The default value is set to "linux.bin".
> +

You have two choices. The empty string or anything not empty (including 
the default "linux.bin"). The value of the non empty string does not 
matter at all.

The wording here implies something that does not happen. It does not 
represent the name of the Linux kernel binary which gets included in the 
FIT image, it is merely sort of a boolean to decide whether to include 
linux.bin binary in the kernel FIT image.

linux.bin is generated by uboot_prep_kimage() in 
meta/classes-recipe/kernel-uboot.bbclass which is called in 
kernel_do_deploy:append() in 
meta/classes-recipe/kernel-fit-extra-artifacts.bbclass which is 
inherited whenever it is present in KERNEL_CLASSES variable. Its 
compression is stored in linux_comp file which is also read whenever 
FIT_LINUX_BIN is set. So changing FIT_LINUX_BIN logic would require a 
change for the compression field in the FIT as well.

Cheers,
Quentin

