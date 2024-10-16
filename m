Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B5DD1AD5A
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 13:33:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.50])
 by mx.groups.io with SMTP id smtpd.web10.22976.1729085581600122389
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 06:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=maMY9r3I;
 spf=pass (domain: cherry.de, ip: 40.107.22.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjjNNUHhvs0AePDK3tbK0LrAk4cVxinw928vjYdCUpydFfgOHF+k7vyh+Fnlw0Kdd0H31Xk0CjknQ1iJNWe7MPGNibZ3Fv7Hfljr/2lWiFVaQRFhaBbdxnGoJBSALlNii0Kc7e9Hf54yw12LdF8k765A9B4U3jI4LfF3USY8PS1pzGpatVaOJq2TW9atsHjtx56zYEu87qp7/A/f1z4/I6hLMUyDhQkXDqRVrHLIsTCQnGW/pZMVjgDELQayEbjl1yi4Da0SN7L35Wbj476Kw41m+DrQ4wScEXX/4hg6+YNpDzMQyLdNd3SWVHEefgAEe7ItuQcxT+mUhW7AhbBG/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paXmNRjTkH+gMX31ZtysH3mDFEGIdKJ4zcMuXLoxS4E=;
 b=zELQbZ51sNq5dPCyq5yJPk5L90w/k502hx+HZwN/m7M3sexuMTk3k3+wj1SGz97ODQl11hQRAFGh90BnDHHWY9RNkXL0i8JHhmo7s1xC826/EuIdklIETRsRSafB7kSTzA5OoJKfX5aunesS8/leTS1VQI9z5tMDW639qVdUK8FzDmMk0NKwNxlt5yNU7500vyPYYUTupIH/hyqZHPowa6w/Bd+DylphD1sBRahIUo6HHxLWbE3PuWpZ3NMSStDIwH3sb14cttvT9CkKaoUUY+1WW9JKiDw+oDVSjbJGpv4b48wg+y3pnVchV1Dnl1elA/nkMKqLHc5a8CEBxvu54w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paXmNRjTkH+gMX31ZtysH3mDFEGIdKJ4zcMuXLoxS4E=;
 b=maMY9r3IZKZ/dyrbddYxLm/ckGPzBis4fzkvENS2Kz972AlcERVbByduqVg7aeG+ue5/ITbml/+YHMX/jfuKg7Kq2NdAY05xxdzMdSteLCdaEoP5EpZWhfyGmOYTSwMHyhe6beQcrMSbX6wZZHrOaElcMn4Us9CrkXYpXr76d28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10537.eurprd04.prod.outlook.com (2603:10a6:150:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 13:32:55 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 13:32:55 +0000
Message-ID: <22d09d87-0868-4774-a262-1d25dda157ec@cherry.de>
Date: Wed, 16 Oct 2024 15:32:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] release-notes-5.0.rst: NO_OUTPUT -> NO_COLOR
To: liezhi.yang@windriver.com, docs@lists.yoctoproject.org
References: <20241016081106.1917900-1-liezhi.yang@windriver.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241016081106.1917900-1-liezhi.yang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0034.eurprd02.prod.outlook.com
 (2603:10a6:803:14::47) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10537:EE_
X-MS-Office365-Filtering-Correlation-Id: 44066470-73e4-4ce8-7e90-08dcede70ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Zm9DUlFhK0t6WVozejNMc3kySGU5RFRjRWtXQXE2NGxmVm9ZRDVvcDZxajlh?=
 =?utf-8?B?L3J5dWJyVnN2OWdsYUpPeDVxbXNuNmdnU1ZPdURmenNqMFNKckZjdzlHT2Z5?=
 =?utf-8?B?dVRWU2haSGgvR0NnaVBrT3h5b1Njelc1QlZqQnY5V29SNk9ZWVdlQ0FmeEw5?=
 =?utf-8?B?SExCb0pDQVpLV0hQNFZkbUQwNDNuZEpJTmtVL294RVZZS1dXZEpReGpNTFdG?=
 =?utf-8?B?SUNKT1ZLT2FTQzlPMEZ2Z3crbi9BNWROTngyelhESFRNclR6NFBrL3dTa1NN?=
 =?utf-8?B?dUdRQTdZY1RFdER4dGkwVG5NQjZ6byt1UDdjNURiTWQ4ZHpCNjE2d0pRajV6?=
 =?utf-8?B?MjhSQ3VVb1paUDVuZkYwWDlMQlpBSjMwL3NxYlQ4VTViaGVhd2VkYXFwRkVh?=
 =?utf-8?B?MEhoZlQ1VWF4azA1YlNuVW1JcENSdS9tQ2hjK2NpaFVVNTNxRVdXMzlMQ2Z4?=
 =?utf-8?B?ZnVjaGdHclhxOVhqc25pbU1zZFZ0cVp3SVI1NUEveGlSaHlHMkN2cWQ1cTdT?=
 =?utf-8?B?eFkyTU1aRGNpQ3JXd0o2blpnS2JORGNNMDA4a2FXWUhiZmdMQXZzS3R2TjVm?=
 =?utf-8?B?S2ZtUDJOQ0tqWFBmTkk5VzRUNFllZVFidFVxRWlMTzh2K2lVRC96L2MyenJK?=
 =?utf-8?B?ekd2enIwR2hWNEtSM01FTGFWWlZCaGtJMktnR1lhRkNHYVJENjVYSXZNMm1o?=
 =?utf-8?B?bGFWY2o0V2diRzdwbHRaekV3V0dFOTBuRTlIeGJiSzIxQW8yODBLTUZETmNx?=
 =?utf-8?B?d3FoWmRwd3VMR3c0alIwWUpFZ25VRlh3SzZEc3ZwYmRxM2ExSTBqR0RqRGZo?=
 =?utf-8?B?TzFwamkrRjdaOW9XQlhiRHNWSitnaGV5VWtTWlJMcGtycXlVNTVjcisxelRK?=
 =?utf-8?B?elZLOWl6OUZKZzU3M1V5NXV4dlJ0R29MMUNNTGxlMmJWVnhIa1pUY3hFOVYz?=
 =?utf-8?B?bHovTkFWZGpScjhUd1NwWGo3L0I5YkphZDRQenhvMEVkazVIakxBUENBRWd6?=
 =?utf-8?B?T3lJWFV6MnpnSXEvL2s1ZE1lTWoxU3NBWUFRLzFqc2luRHZmZ1JEcjFCcC9s?=
 =?utf-8?B?NTgvTFpiVGdKdkxteDg4V2Fwa1gza2FQbVk5a0xXV0FXTmN0MGVHSlEvdmJs?=
 =?utf-8?B?YXppRng3UWRvRThPZDliOHdnekd3SXhOV2gvai9hSFhzWmVvcThVejczVUM3?=
 =?utf-8?B?UFBPV3JxM1RQYmZ2UjNDUlJjOURVdXRQNU5wWHc0c1puekFNa2x6ZmR1V2F4?=
 =?utf-8?B?UjJlMjFLdm5zVGpBNFZxL3RQVWdBTC9YODF2WDQ5Qm4ydHVZTGtzQUd4ZGI1?=
 =?utf-8?B?cndueXViZlZSQUV5cWlUTEZMNVFpeGRvYWhadXNYejBuR1Rra1Jsc0xra0ZH?=
 =?utf-8?B?Qmc2MWhxUWVBMlM0MEk5eVFrS2hqcXVFU0tsL1IrSjNwcDg4MW1DbnAwL3dL?=
 =?utf-8?B?Mm0yc1ZkT3RnUDZJVlliYWlJMXE5NlpuSzBwMUNPRHdkaHVqM2NTNUtLZnRr?=
 =?utf-8?B?WmxVQlMxTW9xc0NQejYvalJ2WDM3c2JIS0pjc3BCRW1wdTRiMmpBekJPMWJX?=
 =?utf-8?B?bzJnTjJFT1JuaXN4cXdRNE1Uc3lvUlg5Z2crOElHRHpBd2ljdGZSbjlOSVZR?=
 =?utf-8?B?UEQ4d0xNVUIvTjV1c3B5OGFicGhtMUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RnZXQk5ub1MxcHY4TVpBdEZyd2F2UzE1QzZFS0tDclM4d1BucFhkVUcvRHN3?=
 =?utf-8?B?Q0tIT005S1BYeDJMM2prZFNUc2J5VFBQWkRCZkpyenJFRFQvaEpuVWE0c0E3?=
 =?utf-8?B?VFJNV2ZEcG4yUWF2T05LYU13ZVRGM3c4L2JsZHFON0hGSTNwOFRveU5iNWlS?=
 =?utf-8?B?MkJ5MzZJOGx0S3ZUL3VESW9MWEVpOFpVbk1Ma3FIb3YrM1pVV2g3MEpxc2x2?=
 =?utf-8?B?MFNra1Vlb0w1bjJhVGo5cDVsMmY1Ykg5eFZzaWo4TXZ3UWRQZkFlR3ladlBT?=
 =?utf-8?B?QnNueDFsVkhrSTF5ME5CUXE2aUZndEEyaFN5RGdsNWdRYnBxSmpFeU5pVTRY?=
 =?utf-8?B?NU9nWFJHWXozaXJVbkt6bjZFYmJBdGE2cUtVWlhhNkxBUXFGL01Cc3JKTVMr?=
 =?utf-8?B?ZVhIVzM4NnVZajVuTlM0MVUvYThwUVBMTFFtTlAzU0lpWTNnaU1YY1VnOEM0?=
 =?utf-8?B?YzBDL2VpY0RKVGszUHlFQk9tTlZ1ZDhTQU11UDNDL3EyRFpIZjgvemtzaTEr?=
 =?utf-8?B?T1ZVOGxsNWtGNElvYkhGRS9IdzYwYmsvcEl5eGdiUldLMU1YKzNNRzVKOSs1?=
 =?utf-8?B?QWExVkNJNmJrZDVWL1QzMFIxZ05aVjQ5QXRRVzUwalhOZmZTQjdDbDR2NVJz?=
 =?utf-8?B?S1VDN29CY1p4V3ZjWS9ULzlXYTlIMUVWVzlhNDNsRHR6T3A1Z084M0RyV3dm?=
 =?utf-8?B?MUtMSDd1eWtXdC9UK0xmcy9XVXJvVkJIYmMzMVBXeVpZYXVwaXZtaWNIL1B0?=
 =?utf-8?B?cit6MHN0N1N1V0NyNCtrQ2grNlZVd0o0NDZaL21qREJPcWp1enFRWFJlV2VX?=
 =?utf-8?B?T1JPVHlLTHluQlJvdXgxdlc4NXdiR2lWRHo3SHRaOTRvZTM4dHBONjhJMWgr?=
 =?utf-8?B?NFc1THQ1WFE3UlBielZBSi8ya29MNnFMVVNNR1JHbXdHelFwVFF3STU2NGFW?=
 =?utf-8?B?aUxhNHYvSUg3VEVBdjRDWmluRTY0MlhoT2M2RTI4dVg3TmVkMnQ4MjUvOXNF?=
 =?utf-8?B?WlY0VkFLTGZwemZ1STROREN2UEYzQy90bFhwd3lCQU1ST0RRRkFsSVljNmtn?=
 =?utf-8?B?cXp4bTJYUGtOT1ZwMDh5R2V5dHZPcVBzb3d1WFROTU1KNjdOVWkyNy9Nd2Jz?=
 =?utf-8?B?alhWTVVIR2wwcnozVE1UOUVlZlhXeHNYbWlrbi9xaGxaeERkazRTNFJsVDZq?=
 =?utf-8?B?d3JLZkpzUXh6MVUwSytoQStZdWVwb3BxK2RlcjhzR05Rb0lVUW9mcHQzWWFM?=
 =?utf-8?B?NjcwRkd6aEpSZUl3S2JBZkE4bWNWUjVWYkl1RXFWYmgxeDJjYWdjdWxoN1U2?=
 =?utf-8?B?U2VnMzkrMUlQa2s0QW1YRGJKN0t1anVSdGNnMWVSYkQzdTk0ZEQ4cmpRZW5T?=
 =?utf-8?B?VFNZVGJoSUJoLzlSTXExV0hTaVhCMi9ETGNFQkJrQ29kWlE2TEZxbERQT0dw?=
 =?utf-8?B?ZDJsNlhmK0JFclVkdStMV1pyUzJWbEl4Mi9ETXYrKzdWcTFLclE5WHFraVdH?=
 =?utf-8?B?L3RpQW1MMmlrUWRoTmtjUVZEZjcyZFd6dFJVVSttSXI2WFZBRG1EYlRReHcz?=
 =?utf-8?B?NGI0VHpKeTBBc05JNXdmVldMaFZxNEdYekhhMHQ5SmpzMEsxUXA4eDQ0RHZi?=
 =?utf-8?B?bGpEN0txNVgvcC9NTmVFcEhKcmJxamMzOWlFakZxcVMzME9iK3Q4MTRuWmxP?=
 =?utf-8?B?Q0w0bVF4bXRGckpVTkxsS0Nua1J0Skg2K2JFNGxWMmxyL0VTNTc3SjVWQzlW?=
 =?utf-8?B?MUgvMGlMU0VMbzNTazVHY2p3ZFNocGtBUWR5cEZEZTBMNEoxSmNmdWQ3NmZ3?=
 =?utf-8?B?ckN4aDRTdzhuaFp3ZkVOcmJESmhOMkVPc0RSZnNjclZ5d2U5WkYyWXQ5Zkc3?=
 =?utf-8?B?NFhtUmFEN1BkRjlDdmpqaE1ROWd2aUo3R0JhWXNPMmZLSmdHN0RONW1HZVJM?=
 =?utf-8?B?ck9oMVdnUkR5NVJvSUUvazZLZmYzdWNwUU5jV0tXdjJPS1dLVlNUZ3d3VWoy?=
 =?utf-8?B?OCt5NzluQVo3U1QzcEF1TmlBeVNnSUhpWUdGa256YnIzZ29ucnR4UGRHL0Rs?=
 =?utf-8?B?VldSeGpFMkI2TFB5S3Y1T0Zpd1hsNmkxbGduOWNtckJFUzFuZG1oTklyREpS?=
 =?utf-8?B?OXpadVcxVHdMNGNXQnF0T1d4amJqSkVFTnkzeEZFS2VjN3o4dXJTUzNibkRa?=
 =?utf-8?Q?H6VuicjFpDWSKyaDkNpXK24=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 44066470-73e4-4ce8-7e90-08dcede70ab9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 13:32:55.4064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: io2FDgaWOEmxqd1c8N5hkyr/RAyiycyWfYrn9aVj42/NNXI1wgJ9dVMxbkamDjJTt9es8wzskCk+CyMIUQDqMqwrHw9x4dPCPGAJixeLacE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10537
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 13:33:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5508

Hi Robert,

On 10/16/24 10:11 AM, Robert Yang via lists.yoctoproject.org wrote:
> [You don't often get email from liezhi.yang=windriver.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   documentation/migration-guides/release-notes-5.0.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
> index 800ba20a2..2bf78c633 100644
> --- a/documentation/migration-guides/release-notes-5.0.rst
> +++ b/documentation/migration-guides/release-notes-5.0.rst
> @@ -217,7 +217,7 @@ New Features / Enhancements in 5.0
>         state directory (i.e., ``/run``).
> 
>      -  Allow to disable colored text output through the
> -      `NO_OUTPUT <https://no-color.org/>`__ environment variable.
> +      `NO_COLOR <https://no-color.org/>`__ environment variable.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

@Antonin, this is a candidate for backporting to scarthgap and styhead I 
believe.

Thanks!
Quentin

