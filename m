Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89657D41C2D
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 12:26:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8078.1765455978432852296
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 04:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=VOSos0I4;
 spf=pass (domain: cherry.de, ip: 40.107.162.21, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWvxpFaF8K039/3HxyuyRyCS2ZKe1rVO7w73xX2a6Zk6Phzx/9NnNBPh2YE4cFPG5mS+no9h04lOkFA6qRV3d1JKHQmqDdyaAoKHNrqlIirZJIRZBAnDvDSHT/sz4FTXttvuHKxry11dwclJ2c3WhljM6awAY+Icb6RLvkZ45Tyo81TDzI4V28tZogfCh+LUtJuFbplzxXiik00P3VqM2vrkZ+reECBakL4H/jjfpRMS5Rgr0kMCPJkGXwHjU9OPbl4GX6QMzZ5bpXxNJcacMdS9fPF8LAISxfVzb9VcApaS520tUnaZAxnRgp6xL2XBXV37aUHEVm2fQEcE9Dq83g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAEskJME/65Hafa3qBXAohIVreptzxNwSwv8mX9+H+o=;
 b=fQsAH+jdKHMZMuvPJnT8o/8O7Lh1jcyUJsNuqzMe9AI1zAput6rdCXlbnDXkNSjJWJ1I55hzYlt/89O27ANacjK3gpStPkW9OzNYUtNkIVCQeHr3+g89U1H1KNc8jcGb8+uaRwM/hpIz5AkVybGSWfz5J2ccXEs2p6xxUKBluP+VfI5QejN+T8rWRaGlpEzzQvQCvDLIfKHIf2QtChLhqkk+1t4inbE/jjARisvrqGgKGbI5Sa9Of5HhlpPgrcZ9CXDBEeVsPcZpsRiix9ljfYDeSB+M/1HqqQgGjxZE51VhPLjvZb3sIuB0+ud937EbYsUuLqYrO0Coe2ckVnmPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAEskJME/65Hafa3qBXAohIVreptzxNwSwv8mX9+H+o=;
 b=VOSos0I47AGgoxffZfAKsTHzA7Cd/WTIJ0UeCCOuYvFUJ/S7QNP8+fSa6SZ6FKgDe37khyOKJorUdAyFV8GzhDzm6LM6cdsW/z5ISejnck4CzfLjQm2/k+alBYW/gw9qfApGv8Kn5hQeiJJmCX/vOWTACyTPg19pphijYQHFlBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB8398.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 12:26:14 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 12:26:14 +0000
Message-ID: <b6c3573d-91f1-4635-b77f-c6daa1a7b0db@cherry.de>
Date: Thu, 11 Dec 2025 13:26:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/5] tools/build-docs-container: move container
 files in their own directory
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
 <20251211-build-docs-container-tlmgr-v2-1-58719c103a50@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251211-build-docs-container-tlmgr-v2-1-58719c103a50@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0055.eurprd03.prod.outlook.com
 (2603:10a6:803:50::26) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: e66c48ce-ac19-4039-21eb-08de38b079ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NVMwQkp1Sit4dzdPR1V2Vm8rSG1pdnVrd1JYQzdUV3ozMXIrZHRoV1ppYmty?=
 =?utf-8?B?clBKZU80UzZYSjZmd20yZ09Zaktsb3B5cEpsSHNaZ0ZRMGJ6bGV1UzFTSjlN?=
 =?utf-8?B?VXZvUU1GOUdXeGRGZXJGKzFjU2RTWGNkeHhvRDl5SHk5OER3bE1pTC9kbzAr?=
 =?utf-8?B?enRUQ3hPbUMzVUZoZzZVd2lUaGFoeXBPN3pSOEhIRmE4REYrc0dCdUpXUjBj?=
 =?utf-8?B?OTJpZFNNZWozVkFOUXFHTU5XQlBXaHdsS1dTemxsaDhFMkx0dm93ZmN0aVI0?=
 =?utf-8?B?Q3NWejJObzJOU0VZK0dqS3lwaSs3RS9NeUovdWpyeE9XbWZldUNZeUtRUFpz?=
 =?utf-8?B?S2ZSaWE0RHhFYkVoZGpSbzRiY2RtOU5jTGxWMWo5Mm1LMUhXRDJjVGJ4aVlG?=
 =?utf-8?B?bWhzYmVKOWNaMklYYjVERWNxK1YzRitRZnRKcFpSaUE4QkRRSDk0ZFkrdnhx?=
 =?utf-8?B?V3ZpWWlvaEQ2b2FLWXRlUmp4QWdBclY5a2xDOWxmY2E0WTBENlh4VWw2MzEz?=
 =?utf-8?B?a01yVWpuYkJMc2lRK0NxRXFJTjZRMTczU1FzdFJCL2J2ekpMc1V4RjV2ekxj?=
 =?utf-8?B?Um1laHFyUXRKcmUwSTlXSUZBZXErSTVGcW9NS3dmaHRZRyt5L2MzeHZTS3N5?=
 =?utf-8?B?REFBRjNHQzJzVTZidXlOZjhGbERVaG8wZ1U1dFJUZ0MzSFRLNnArY2s4M0d5?=
 =?utf-8?B?eVAwYmdlMllYZ0M3czUvcm5JaGgzWlB4alhMSmNSMklsM2VQd1grOVVJTytI?=
 =?utf-8?B?NHZZdEg5ZzE0Y2tkWFhrRnNzMVRDNm9tVXVEOGNjMklIbEJlQU5SSDRKL3dy?=
 =?utf-8?B?eFZZbFJYV3RKRVBYQlRPTlZvbVZlL084NkpoWG91dGZJSFFpMEdvcUJ2TVFj?=
 =?utf-8?B?cUpmNkpZMjAwYUNtK2hCbXZJTCthV0Z0NncyL0dUbVdPVlhxUDJrTTIvaWhq?=
 =?utf-8?B?MFA4RUM4N3BsYzJpckpMRWJ2QllJRnFOazJ6VkQwSFVsWXFPZW8rNmNmeDFo?=
 =?utf-8?B?ZkFIbkx5WjJPSGJGcmJra0d3NWJpd1JVUzVtL0lMUUJWRERpY2VORUcrSzRz?=
 =?utf-8?B?MlZGZHFuT08zYXZFdkRVRy9ObStZSFVhQkJ0Z0h1K1FVODRSNWxaaXk3L1dl?=
 =?utf-8?B?L3pzcm5NNFlsYWtzYVc1Vk40M3JaNlpMV0ZOMzZhTVVYeGlZQTl3dkVoYWVx?=
 =?utf-8?B?eGNOb01Qd3hFdHg3SFpxaDdXaVRrQi9qVUJpOWViWjR4a2FXZVUrMmN0d0Qz?=
 =?utf-8?B?UkJ0OUhTUEVjd1FMc2hLUzdUblhvekZPSG53dXFLdTNlejd5Q2R5YUJXamMw?=
 =?utf-8?B?czJxdThwY2gzdTFoKzR1K3JPVEFET1ByVXd1VmpYOUkwM0M4bXlOL3RXek9W?=
 =?utf-8?B?QkQyWjhRajlrdWY5QlNwRmFlMzRsTVU5S0JsQSs2YXdPb3Z3czUwUGpDY0t2?=
 =?utf-8?B?K2JiLzRLWVdiSmRBdGRPRW5mNVg3b1MwcmJaWERCODNpdCtjcWlJd09UOE45?=
 =?utf-8?B?VThzVTFqYXlOUS90VmZReGU2eGZuY2FERHladDFGOG9xSHc3UEpUTWc3STZN?=
 =?utf-8?B?Qi9paUV5bDJDT2RXdWNiV3RLaStFWHhWVGkrdEUrckI4UjJqVmpIR1lDcmZp?=
 =?utf-8?B?aUFyM2xPTkxLZ3MrQ2orYlNTUUtZVVZkN2twVStXNUFhcG0yd1JGbUxWMGs1?=
 =?utf-8?B?emJtTkMyKzVJQTJhckNsdytSYzR2UGpRbWMreUNuVTBRNkJGdG85NWZHUEZF?=
 =?utf-8?B?TnFidUNxeUdKZytEZHR3VFU0VkpydnpnMk4rQ1o0Q3dTMUdvaDFLdk1jTEFj?=
 =?utf-8?B?N2V6cUQ2UWw1eG5nRnlKRnVhSG9ZR1VubjUwSnlEbkJORmNKb3FaSjBoUWw4?=
 =?utf-8?B?eGFaWEN4QXNjTHJ2YysxNzBSRVh5d05HVlM5ZnJQOGFMTnlCakhBWElwcjlU?=
 =?utf-8?Q?rCP4nahz7U8ThQVK4kTenOt6ZoWeW4ED?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QnIzeDVrWmhtRVNOWUIyeEE3bGhhc1RnNVFxb1ZDdWR1RUlqK3NiV2thRTRp?=
 =?utf-8?B?QTlGZ3YxUndpK1NZWXlYQ1VxT1pTYkdhWngza1JYY1I1K1Nrd1IxTlhVSVdo?=
 =?utf-8?B?eEVpNEd0ODlPcXVrS2dDSmpwNWtpSkc0RzBROHhsdHdzMjZ5QkZtTUlZUkRS?=
 =?utf-8?B?VGFvdzBOenR3QnF4RW9EUG9pSi9INUN2OTV2S0FvUjE0MXhiZXo0SE9TaTdz?=
 =?utf-8?B?NkxOOFVwbTdENC9kbThuQ0VyZmhYemlPamNKOHN0K3E4a0ZlY3ZYVTB2VXBI?=
 =?utf-8?B?QmI4MFQxaWlZcGppWC9Uek5sVWVNeUg5MGFYcFloOVBTaUxLQ3p1MWtoUVB6?=
 =?utf-8?B?S0kwaFdTYnpOWlZrbmE2R1JOaWJDL21vclE2U0o5ZXM2N2loZzQ4VVlYemZG?=
 =?utf-8?B?MDI0T1c1dlN6MGEwUUIzNi9nRkJURWtXMFJKSGVEcFRLeGxkY0R3bUdhcUpN?=
 =?utf-8?B?eDVQY0wxd21NczJOdUVzM1V0bDltVmJ3bDBjWktyLzFGMkV6VSsrNnYyeTMy?=
 =?utf-8?B?TmFGOW52ajJBTkswcW9nZDk3dk1CeTYrajlzNEc3MFUwOXdMMHEwZGFLSUJ3?=
 =?utf-8?B?MEJQMW5JZmZ6c1gvWE1NUnljalZEeHJQZnRsOGJpV2gzSXdvS0JKeTQ4VlI3?=
 =?utf-8?B?YXYyWHkxSW1udHlZTUJEekh5VmJjb1o5UzBSVnFsbEw2VTh4Q21IZjg1blNM?=
 =?utf-8?B?a3U5akJYbTNoT2pIVUpoc0FRYkFoeXVqa2Vuemo0ZE5SeExXQzZNNGZPRkV5?=
 =?utf-8?B?WlcrMWxKdnJGQTl5UzlLd1BxVTFQdmlyZ1ZFK2FsVkFYbytCckd6cU1yODVh?=
 =?utf-8?B?MlMxK2ZqdzVrOEw3bW5KMytJVkVCVXFDOHVkbVZjMFlac0EwaTNHc0xJdlRK?=
 =?utf-8?B?UEkrSVNkZnJVOTVtbHZnYWhRZTRuOXRzWFRWVEVqVnA0d1M5bVBtR3l3VVdq?=
 =?utf-8?B?Y2loeFFIWEszU1liMmJKNEFJbEJvRHJ5cGJqa290Z1NOd0pnS1pnUmFjV1dW?=
 =?utf-8?B?L3I3bUkraXJubWV3WFZEbENuRU1YeDNaNnB0WFhaTnBTSk5SclFDRUxpTFdB?=
 =?utf-8?B?ZCs0aWIvdGsvNElkRkd1ckovRmdpOXFSSUhpSEtJWjJyNDMxYUp4VHJNTUE2?=
 =?utf-8?B?RURDbklXQnlXYmhvendUMmtYMUF4MXFwaThiYzUwOEh1eVgrZUh1SUtoQTRu?=
 =?utf-8?B?aVIxZFRpcXVGUlhKM21KSWZnYTZBR2N4aTB5YlhBS3N5aEx4b0tTYVM1VFN2?=
 =?utf-8?B?cXMxb25CNEZlN3ZXb2ZZSVFuWkgrSlZUelEwYnZ4WFp4aThBR1dneVl1MUth?=
 =?utf-8?B?RjQ4V3ZlQzFtektWV2l4Z2pwMGdHd29NYWc3YVk4SHBCTTV5Znd3MVZzQm5E?=
 =?utf-8?B?Y0k0d2x4U2RFelZ4M1RWTUdoREw5N0VMNW83Um5LdjJleGRoMkVhODlodDZE?=
 =?utf-8?B?a0JGc0QxVUZWN0ZzRURCbHNrS1Y4SGhNaFdWOXZsZUVqd1RmWnlRWEpDcFBG?=
 =?utf-8?B?YjMrNEFYdFpjL3ZDSUFMZzMrOS92STZnRnR3S2h4K3RKM0xpemI5Z2habjNE?=
 =?utf-8?B?YS9nN3EzTytHdjI4dktva00rVi9NekNUcFNKSFk3RHFWSklucEVQMXIrUTZm?=
 =?utf-8?B?eUVJK3Rvdlg3Z0Q1SlZHbGVzQWVJTEx5cFBSSWVieVpId1EvVDNWcjNNcjRH?=
 =?utf-8?B?U2h4RnFZUmJmay8rUU5aUHJGV1o5M2V0M3VUYUpFZkUwY3laQWxqUzhuZURK?=
 =?utf-8?B?eDJweHVuMEFhTmdvandOTWFsZk5qKzUvak5POEQrU1lla1ZoQ3Qyc0syZk5v?=
 =?utf-8?B?NkFBV0c3WEVSaEZQL2VONHNsaGZOdGlEQmVEejhzcyszVSs4ZmNSbWZjTlZr?=
 =?utf-8?B?cDltMnBmV0YycXhqRklkTU01TWs4S0ZqSkhaL3RUbGp3OFBzY0lPcmhJYjhG?=
 =?utf-8?B?Sm54b29JaXduTmkrTVJrenFQODdjemNLRUFwZk14VzhSSXNwS00yTDdjdk44?=
 =?utf-8?B?NUlBNndrTnBxWEVvVUJ6YzlMNFJzbnZnbGhiZ3FnUHJqOHJMMnlMQURHNnAz?=
 =?utf-8?B?ME5obkFuWlIweTB5cjNVOHl6VHI5ZUlCZWFhWEh1STRsVWhabjlKS3FNaHBU?=
 =?utf-8?B?TTRqdXV2aVhUQzVnR0l6SWZQZVdoSXdJdDRvYk14QWhEbDR5cGtONDI2SmZ2?=
 =?utf-8?Q?tb3xwETlmlg+ZoF4cI5Cg94=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e66c48ce-ac19-4039-21eb-08de38b079ab
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 12:26:14.0898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYZa+w2dDXMssC8Oyo8i0wnDlx6iUN4kPU0w1LbcFGvlSW7gj/Sw/PDn/V0cTimAjunoV80Fj/0RXitzaD7yoMWTIZ+dLH808sgJUD1iUSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8398
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 12:26:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8252

Hi Antonin,

On 12/11/25 10:06 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Create a directory to hold the Containerfiles as they were lying next to
> the scripts. Change the build context of the docker build command to
> build from SCRIPT_DIR and pass the host packages scripts and container
> file relative to it.
> 

It's unclear what this helps with. (I'm assuming this could be a remnant 
from last version's ENTRYPOINT support attempt?).

> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/tools/build-docs-container                    | 13 ++++++-------
>   .../tools/{ => containerfiles}/Containerfile.almalinux      |  0
>   documentation/tools/{ => containerfiles}/Containerfile.apt  |  0
>   .../tools/{ => containerfiles}/Containerfile.debian         |  0
>   documentation/tools/{ => containerfiles}/Containerfile.dnf  |  0
>   .../tools/{ => containerfiles}/Containerfile.fedora         |  0
>   .../tools/{ => containerfiles}/Containerfile.ubuntu         |  0
>   .../tools/{ => containerfiles}/Containerfile.zypper         |  0
>   8 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
> index b91a6daa9..7d25b15b9 100755
> --- a/documentation/tools/build-docs-container
> +++ b/documentation/tools/build-docs-container
> @@ -23,7 +23,6 @@ set -eu -o pipefail
>   SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
>   CONTAINERCMD=${CONTAINERCMD:-docker}
>   DOCS_DIR="$SCRIPT_DIR/../.."
> -SH_DIR="$SCRIPT_DIR/host_packages_scripts"
>   INCLUDE_ESSENTIAL_PACKAGES=${INCLUDE_ESSENTIAL_PACKAGES:-0}
>   
>   function usage()
> @@ -140,12 +139,12 @@ main ()
>       --tag "yocto-docs-$sanitized_dockername:latest" \
>       --build-arg ARG_FROM="docker.io/$image" \
>       --build-arg INCLUDE_ESSENTIAL_PACKAGES="${INCLUDE_ESSENTIAL_PACKAGES}" \
> -    --build-arg ESSENTIAL="$essential" \
> -    --build-arg DOCS="$docs" \
> -    --build-arg DOCS_PDF="$docs_pdf" \
> -    --build-arg PIP3="${pip3:-}" \
> -    --file "$SCRIPT_DIR/$containerfile" \
> -    "$SH_DIR/"
> +    --build-arg ESSENTIAL="host_packages_scripts/$essential" \
> +    --build-arg DOCS="host_packages_scripts/$docs" \
> +    --build-arg DOCS_PDF="host_packages_scripts/$docs_pdf" \
> +    --build-arg PIP3="host_packages_scripts/${pip3:-}" \
> +    --file "$SCRIPT_DIR/containerfiles/$containerfile" \
> +    "$SCRIPT_DIR"
>   

This seems to be doing two things: moving Containerfile.* into a subdir 
containerfiles and changing the context dir from SH_DIR to SCRIPT_DIR. 
Is there a reason they are both done in the same commit? Is the latter 
really necessary (I'm not sure it helps in terms of readability?).

Looks ok otherwise.

Cheers,
Quentin

