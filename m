Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D495C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 10:36:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.88])
 by mx.groups.io with SMTP id smtpd.web11.49237.1742207808023379853
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 03:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DGWbdnD7;
 spf=pass (domain: cherry.de, ip: 40.107.22.88, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpZYXC0tXvrZm7aOfmEFtcOd5902cFeJQqT4Av3xc0ugUoWjmmnPq0GTBwvmGlcQaAhOTGlpZ8bbG+AAV5g8i1aY6bxoM84wN9myDCD+wZpxltd/AyTwhMCgHOK+0X8vVNX3TI5ySmvLJbcgk8Egnk6y3zPs6L+rEcoXOnfXTGCZshC9it6AcBDceG7egejdJnli9Egsh6ZpQ0IPdnXv4dOqhl8El4wdg319828u5sk2XLIAlQ+AE2ImguINcEhLvUEjq3Wb4CO7wF17jKW0YMMToPuktn5bl2KbgZrJBA94xUXPeO4yws2NmlJcdSvcC+MKrN2rFYslb59nElkJiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6bCSg5bNhKYCMycp+KFvBTfZcwCP2WSGILYd+vcSbI=;
 b=QbPeh0F9tMs+Px3moRxUpz8kNEob3JnqN8knKpyjC3b+ZGT5ngWYJqHfJjhxYxE/iolK4C43jlDVAiw/P90Zv/3Ydh8iFqScJzZTcEDpCAGInvxqb7spM7aVcW3U1TCnbIRQPh2kEyaiSAxEqdwZAtws7bQUYXwlScQwl5rmMp8Xl/Tr6t3Tf8tq8/PdY6xrfsx58iQOP4Z7Nq55mvy5gh62UyEeekqPnQ8D26osbQmRdAQMvOeysYnAG8ifMiYN0VsRqVpU6Wt7myzfbCD/62pmUcfkYF3JAyeF+oHG5hJJeG7/7cbWVLdYIS9W/ERJBW/gIwVpeCUr3V00R5vLmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6bCSg5bNhKYCMycp+KFvBTfZcwCP2WSGILYd+vcSbI=;
 b=DGWbdnD7UjfhjRrYTtzxFJJUaITsE80NlcoJ0q2ziGy3A8hhyQv9elv2CQHmQXflF9fepzO4xKrHIVRNMYktYkt8lcyNs9RZi5r5YfOpdYPDJcey2+/OWcevV0Zh5ZeEuSI9BaDX3gDIpdwPWDw61a/qCRm+iu+ChuXd2319Img=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10379.eurprd04.prod.outlook.com (2603:10a6:150:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 10:36:42 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 10:36:42 +0000
Message-ID: <edccb79c-d1cd-4112-99f9-a1b54773a4f4@cherry.de>
Date: Mon, 17 Mar 2025 11:36:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v5] ref-manual: variable FIT_SIGN_INDIVIDUAL
 mix-and-match attacks
To: adrian.freihofer@gmail.com, docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20250313211435.3042719-1-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250313211435.3042719-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10379:EE_
X-MS-Office365-Filtering-Correlation-Id: 85867596-9cb1-46e4-0c74-08dd653f9b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R2ppeWNhcTZhSTFsazhtdUZBaUZWY2Q2V2dpZFM1REhnb0ZlOFpLVmloZWc3?=
 =?utf-8?B?dmdVQVhETVVPRVVjUE1UWWUyaTE1ZVhGQmF0Z0l5OTg5UkJqUE9lSjMrcXk4?=
 =?utf-8?B?RGFnM01VQ0lhM2o2ZHZNV1pNcmFReWt6Y3VBU0xnRStZL2ZYdUpFaEVNRm9K?=
 =?utf-8?B?ampMZTlBbStnMHRhVDVramtDdU5Sd2RSUm9pdU1nWUdrdmVjYjJWbmZWUzlZ?=
 =?utf-8?B?ZWg0UzVFNmlmWlk1TzVYRWRXeGgxMFZhRzdTV2ovRURQbXBRTFd5ZnNvNm1M?=
 =?utf-8?B?QmlKVUh4ZlZ6M2hqMGNHQU5MNWJxWHJEOHpjUG53R3M5QUdkMTk4SXQvcFp2?=
 =?utf-8?B?SHA0NlIyd21nbElIZ2xLYWg0bi96MjN4WHRJMkR1SVkrRldJb2wrazZoME9B?=
 =?utf-8?B?Y1pRVVFzZVU2ejBiOEpDZk5uRFA1RkppampCWGErMGQra0FVb2MrMHNLbjlO?=
 =?utf-8?B?NjJKUHViRGFLM1NndGpDSG1lSmUxRUN0b05FYklqSllTclhSalBMenQ0a1NT?=
 =?utf-8?B?RnljRzlkaVE4S2FySG5HOGx3Vkg2NExyV09LQWkwaE9Ta0dheFU5OFhUT25J?=
 =?utf-8?B?L1hnWjlIMjFMUGo3VlBURy9mS1NaVUVPY0RRWGpLclI5QS91RDByL2t5UE5Z?=
 =?utf-8?B?dTAvMjRNY2lhMWtKMFJiMjlOUWIxWmw2WWxCWENHRUtuWCtWekpvOFI0VEJE?=
 =?utf-8?B?TzZtNWVVUGxneEwvaHBqYWZRTHlla0V4VTZNY2xIMHdMOURhaFRoK1FYOVNv?=
 =?utf-8?B?TWRuOVdjT0NtSmM5elZtVXFTdzZOUGVOZmxrdExOT3o3VnFETTU4bTdxcENT?=
 =?utf-8?B?WFhEdU9hbE1WZmdmZ2hZK3ZCVENoclZZNXBXU2c4UmZzblhMNWJWc09JR1dC?=
 =?utf-8?B?MEVpbUJ1czJ3WStlU3d4S2ZYdWtKMm5KU2paakszK0NnZGJic0ExUnZUM0VM?=
 =?utf-8?B?WDJWZlRsT2dZdWlzRFk5OVZpM0ZveVBkYUpPWjdvb0pLTFJJak8zTXl6QndF?=
 =?utf-8?B?NkhyYXRrUDJsaktpenhEK2FzVlVXaEJxZVVDM20zWkd5cVA0bzlCMzJJdGdH?=
 =?utf-8?B?dysyQnNOV09Ld3JITUd2bHNoUUcwUkVYSC80VGFESmpGS1NGWXhsL0pWR09I?=
 =?utf-8?B?RDZEZkJNWjdvSXNQMkU0c3B3RlZ2VFdIUUNsMlArZzRmTVFGM1lkSzRjdUlI?=
 =?utf-8?B?MU82cHNUYkNSVk1wUkZtd2J2K2R0alZ0ZFBWbXJSOUZEam51dXk2WmtYSmY2?=
 =?utf-8?B?Sjl4UU1DTStvSEV5aEJscnBsVldZTkQ5eHNyQVRiT3F1QlM1NEVYWk1JNGx1?=
 =?utf-8?B?M1ltWGlzN0tmaTlWU0xyY2Y2eTM0cFMxeWNlMmJ4SnFmeTU2WW1rdzhSdFJG?=
 =?utf-8?B?UzRNYzF2Q3pRa0c3VEVYRERYMDk1a09DK0pvQlhCU2NpN0l1Q3hJVi8vZ1A0?=
 =?utf-8?B?cUtHUTVEUy9KZWFoSVFvem9EcGtHU01mdFQ2eHJHZ3lEZCtDS0Y4NktSMFRm?=
 =?utf-8?B?NTZuM2diTUtOT0VEOHhMbU9TcTk0OEo3N0cxUm1GOGNJRTc5dCt5aWI5dmpC?=
 =?utf-8?B?NGZOSHJidVhuajJ4a1Z2UFUzbktyOU9yaW9PZGRaY0haeXR6V2xXcDlQcVF2?=
 =?utf-8?B?UTlVZHFodEc1c0dZTnJkY3lqUkdwdFJvWVZFNnBDSmt3ajlhSFZvUlBhYkdV?=
 =?utf-8?B?bENoZ1FpY2d4TENSVVZUNmppMkV5NjlRT1RsWlIxc2E1L1MvbVdQSXU3a3hk?=
 =?utf-8?B?TWxqZ21VMml3Y0MyZHJOQnhpejIybXdaakFOTmNIbTZyaXk0aU1mQ0VzRmRW?=
 =?utf-8?B?YUZDekJkZFE5Ny9HSDJ2WnlPY2VpQ01tVjE0Tjk2YUZxQUV5QVFOK2hqVDU2?=
 =?utf-8?Q?SAbQx5b0vcPX8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aVNIU1Bxa1JkVm8xL3Q1elJrMk51M0w3bzVibzlDekdzempZbUxBQVA0OG1j?=
 =?utf-8?B?SWlRU2xFSVB3ZDJKdkFkSllrcUx5OGJ1eWlYUjZmMi9GeG9yYXdnK3gxK1RB?=
 =?utf-8?B?dy9mY0lpYkkvdDEzVjc0cmEyZVg4QTA0dVpyOGRwVnNad202R2NSUmZTOUNV?=
 =?utf-8?B?T1VsOEVXUlQ2MmJJNEsvUHo0b0VNdysxU2JKTkZqWTBJc2VrcFlJVk9NNXI0?=
 =?utf-8?B?RFlzbHV2SU5pQUthV1pBSFRpSFA1bFZNdEZySW9Nd2Y0dHVONFpoV0o4cDF3?=
 =?utf-8?B?VVJrSDFINDg5N2Yvb0I1Z05PTlJIN1pQQXJ6a2g2cVp0bWdFMkNSWVpIYk9G?=
 =?utf-8?B?dE5ZRTU5cDUrcUhIUEhaK2xvQ2liL2VLVnR2ODRaQjlkTnJRb3FkSTFMOXYx?=
 =?utf-8?B?SUlpZ3dXTUdSelNPVmhIWWxzVzVaRGRydmFGeXlDSWs1U1BBMnFtSS9sOEov?=
 =?utf-8?B?aWlTSjZzeDYrVDlmd3Y3ZlN2L0ZSVmJNbDN6MW0xT1pTZ2Zac0RnQmU4Ry9p?=
 =?utf-8?B?VENDUXdHM0x0Nm93ZENDb1RzWTQ0d1pLanRRbGZGc1kzWHhKd0NrcnNkZzRs?=
 =?utf-8?B?Vk1aalMwLy9acEZJRGhBYzdWOWZvMjRBeWNTcEhoSjA5L2RQc2xIWktYVk5R?=
 =?utf-8?B?dkN5QndESDdhMGZHVjlpTzMyN01za2FhcFg0aklEYUdnUDRWc3JpSkcwNkh2?=
 =?utf-8?B?VFFyeGw0L2M1bWxVOHJmV2pFdG9UNGpGalJ1ci81amZzdzJ1ZDk1SXkxWnVv?=
 =?utf-8?B?cUo3MWRGaGgyay8wYzRTRG03cnRkS3puRXFRNFQ3THd1QkxPbVJUcHE4VThZ?=
 =?utf-8?B?d2lVa3I1Z1lCZTZPSUgvWG5EMU5aVzRMU1JEaDhPR1ZxV3hFVy9EZ3dVRUhI?=
 =?utf-8?B?MTRZZkZ0UERPbGdRbW96YzVPbXBmdksyUFlOT29LK0kxUWJTRXJSOTFWRGR3?=
 =?utf-8?B?MlZBakxmNmtxTGNBWWZsZUl4WTZxV2hpOHMwRU5vNWdqb05nRlBtL29OYWZ0?=
 =?utf-8?B?NkZaejJlTUJ4Z2V0dnZwMVJhdXppMEd2V1FnaUhNZzd0bWZlZmxSMGdDV244?=
 =?utf-8?B?M1NZaFgrOHArVkE4WnlhSWJKajc3d3VmK2FpRkhQSGZkdGxnY1ZkWG9iR0Ry?=
 =?utf-8?B?MTdvcWE4YlZ5MVFZZk96NDZQVnlTa0hhS0NJTnBGbkRUSUc3SzF2cUtZdldL?=
 =?utf-8?B?MzcxSmQyYmZLVGsrbElydnNWTFpnalFZbFF3QXZoNWNoeStNdlN1dmpRV2Ey?=
 =?utf-8?B?V3ZTaFluOVJJYWM1WVpwNmdvNENmV21SV2tGSzM3Z2hPZ0J1Z20xWTY0ZE96?=
 =?utf-8?B?OWt4bGxlNkR6YU1pb0FaMmRsaE9mL0Y3RytoT282MlNsV3BYV3dwN1Vyc005?=
 =?utf-8?B?Q05kRFFoQzR4aFIxRG5rSkpBUkw4UTZvQ2NmNEdHOXVoeDd2c3kzRWNvNjF2?=
 =?utf-8?B?S1N4cmphSG9QVXg3L0x0Q3NnT1kwc2tSdlMzTjBWbmZlSHhpQ3dPTDQwT01V?=
 =?utf-8?B?bmlrVDdIZWxMUlM0cUtuZHMxTHgxZEQ5bjFsSU9Xb1c5Qy8zUTZkVE5zVmZ2?=
 =?utf-8?B?am9wdmxjeFo4N2FRQ1luTUV3RkFKVmtxeDl2WWJVMStyWWUwU3pPM1MyMW02?=
 =?utf-8?B?RU8xWEQxNXRMMWtKMjRJZlZ1WmpCcm1LTHJQWHlNSjBuSUVCVDRoODYvdUZF?=
 =?utf-8?B?MW4zL1YxMHAva25SUmRCOXFwbUxFVHZ2TFpFbGVNakp4K3RWajR3VS83MVBU?=
 =?utf-8?B?cXU5Y3IvZ3FBbHY3emNFZXZSanZiKzFQWHlkNFVGSE0xVlNGU255RUtIRGpl?=
 =?utf-8?B?KzN6Y1B3NE5xZUJwV0QweVZxcGhWSDE3dzU3SG9KcnNjcllvWDBRbUhNQ1pr?=
 =?utf-8?B?dGxQOTU3Uldrbmk4VTJRUUllMFpYSTFOM2pONnpMRFN2aDAvWkhPbUhycnhI?=
 =?utf-8?B?Uk54Vk9JTlAycGR5a0QxOGoyUzdSSGhDVkt0cUxFSXE0aE9UcmV0TERwRkFo?=
 =?utf-8?B?YzdobEt3NDRpc2pDSlVBWnIxVHhhUzZHVytnVkREUlpNRWRFbCtibjBhMXBa?=
 =?utf-8?B?bnBJWFJYWnczN1RKRXhldnhZVVlxcWFXL21wYnE5dURtVy9nVW5KcjZYbFph?=
 =?utf-8?B?Z1BRRWVsZHpVc2pnb0JNTmJMbVk0cTZ2UnpMV2lLRjY0Nkp4djdHZzhQK0xL?=
 =?utf-8?B?SkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 85867596-9cb1-46e4-0c74-08dd653f9b66
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 10:36:42.2735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQ4Sn59yuyMNxsE1F/S0K5insw81rDzqAz4bza5087RIlrx2Ums64R1cg94xCd9yHI1QNp4CdKVufXgVOMg2C61DUdLn+ne7XAoF9oLEOyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10379
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 10:36:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6575

Hi Adrian,

On 3/13/25 10:14 PM, Adrian Freihofer via lists.yoctoproject.org wrote:
> Incorporate the lessons learned from a regression introduced with commit
>    OE-Core rev: 259bfa86f384206f0d0a96a5b84887186c5f689e
>                 u-boot: kernel-fitimage: Fix dependency loop if
>                 UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
> and fixed with commit
>    OE-Core rev: 0106e5efab99c8016836a2ab71e2327ce58a9a9d
>                 u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1"
>                 behavior
> into the documentation.
> 
> The use of the variable FIT_SIGN_INDIVIDUAL is explicitly discouraged.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   documentation/ref-manual/variables.rst | 32 +++++++++++++++++++++-----
>   1 file changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 861b04eaab1..4a85de9586e 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3170,13 +3170,33 @@ system and gives an overview of their function and contents.
>         :ref:`ref-classes-kernel-fitimage` class.
>   
>      :term:`FIT_SIGN_INDIVIDUAL`
> -      If set to "1", then the :ref:`ref-classes-kernel-fitimage`
> -      class will sign the kernel, dtb and ramdisk images individually in addition
> -      to signing the FIT image itself. This could be useful if you are
> -      intending to verify signatures in another context than booting via
> -      U-Boot.
> +      If set to "1", the :ref:`ref-classes-kernel-fitimage` class signs each
> +      image node individually, including the kernel, DTB, RAM disk, and any
> +      other image types present in the FIT image, in addition to signing the
> +      configuration nodes.
> +      This can be useful if you need to verify signatures outside of the
> +      U-Boot boot process. By default, this variable is set to "0".
>   
> -      This variable is set to "0" by default.
> +      However, if :term:`UBOOT_SIGN_ENABLE` is set to "1" and

s/However//

It's not really countering the arguments from above, so no need to use 
However.

> +      :term:`FIT_SIGN_INDIVIDUAL` remains at its default value of "0", only the
> +      configuration nodes are signed. Since configuration nodes include hashes
> +      of their referenced image nodes, the integrity of the entire FIT image is
> +      still ensured. At runtime, these hashes are verified against newly

That's incorrect. The integrity of images listed in the **used** 
configuration node is guaranteed. Loading image nodes directly, not 
through a configuration node will not ensure integrity.

> +      computed hashes, ensuring integrity.
> +
> +      Enabling :term:`FIT_SIGN_INDIVIDUAL` typically increases complexity for
> +      no benefit, except for image nodes that are not referenced by any

s/no/little/

> +      configuration node, which would otherwise remain unsigned.

and also when directly loading image nodes and not through configuration 
nodes, which is typically not recommended (but is possible).

The image nodes can be referenced in unused configuration nodes but 
their integrity will only be guaranteed when loading them through one 
configuration node that refers to them.

> +      For most use cases, it is recommended to keep this variable set to "0".
> +

Can suggest instead (don't like the "recommended"):

"""
For most use cases, setting this variable to "0" is good enough security.
"""

But no strong opinion :)

Cheers,
Quentin

