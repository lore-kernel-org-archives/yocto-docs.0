Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885B6C9EC8B
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 13:20:43 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32459.1768224033414284853
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 05:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JO0uu7jw;
 spf=pass (domain: cherry.de, ip: 40.107.130.16, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9CVQA30KbT594O/0p00W+i7bS9QMTLTs9OJ3du4TopF+PiKWBY8HfXrtmuFClI454MD0nEztX/lF6b3EuUtlt0uxR9NmBthcSSMxSwxA2+850geNcuRbNkvp+Z++yeQBhnv2ceGmC0Ny4mbC1zQFnjw25w+eruHWyMNLxjlMCeHEd8cCplCWwGpd0gtUXKkHqDb7WDbd9U52wRE767hG6uJR2kGCzFkrvVnD0sr7jX743WcPfSvgE99dhohpipmc66U8SQqbFyxLZwm33PTMaBbBkPITmm6sIoKxroBPDfedb88nFziFauKXRlumYwm/WBtWLk36R2aJJGSQyemkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23yOSDLIt8Wk3I7V0fOwyc1lycGO86SqRniQP8tAqPs=;
 b=xQdS1IDR97fiRYGEbUYv/1el1CCgyXUYVAHBofaMZEGODj1RpfN1sgOWkpVRBfS89u+dL8camxp/iHPWJS7GJn1kJg0zFzSYIybQrw9kdWKK/5l+0tS1auVmmYytarz7JGL//oqyyefMyvqrgx1P0kGv0beZryg6Eodxd4c4f984hg/+lHmEH1vt1srYckqAFPiXAyBDD6zFK/ZVcY9ATmfaFA4MZM/GJqnNfKKZL3e4ccSGwl/7wr+FffBdzNMvPsGbLpyY1pLEQ46DqxpJkJ1hXigY4xu1IX43Uj800+bANAPbbcLbltIB3ZZL+Bc2jjTgSyH1nJMCRLJgtsM3qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23yOSDLIt8Wk3I7V0fOwyc1lycGO86SqRniQP8tAqPs=;
 b=JO0uu7jw8qRy4fQVJL2c0vfH9+/d1ki2RTM427M2kZYxpfsnUJgaYgcSaWVjNUap+t8ZLhTyhOUvtUUStuuSXUFW/dSp5KrchvrirsbDKSBfRc64+LqaxIv5lyh2TdY8dZKgftf0hz2/4tAN63z3KS5LzJqB/huaQpC2xE5FZds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB10627.eurprd04.prod.outlook.com (2603:10a6:102:48b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 13:20:29 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 13:20:28 +0000
Message-ID: <27529486-7a3a-4108-b8f9-984d68cbff52@cherry.de>
Date: Mon, 12 Jan 2026 14:20:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] tools/build-docs-container: allow passing extra args
 to $OCI run
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
 <20251222-concurrent-safety-v1-7-e3d86e44cd38@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251222-concurrent-safety-v1-7-e3d86e44cd38@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB10627:EE_
X-MS-Office365-Filtering-Correlation-Id: 7507751d-b260-4909-1df3-08de51dd5acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UlhSQ3R2WGwxTFA4Z3U3cFVydFVLa3lyVmlEb0lIV050ZjFBL0tSTmQzS1Nt?=
 =?utf-8?B?YWhLeWF2NWc2RmJXVXJyR1B3YkFlZjRRYXNZbVFsMEwyWEpqU3lDeDRZQ2h6?=
 =?utf-8?B?Y3hFOStsRnBVVDBiclp3ZTVPR09uN2VwL053OU5WN2ZUd0NacjFkZDI2VFN1?=
 =?utf-8?B?aGZrYjJzQTllQmpnR1I3b0ZsRk1LclBNN3hySGNiQ243cEtLaGREODJNQlM5?=
 =?utf-8?B?OVdBVFJQRWxpay9zbDh4Wm9EbGliYUxicm1WdWVuYW1FYUFyWEhqaDFxbkFK?=
 =?utf-8?B?QXZuRE5tb2FEYU1iZHdWSzFUSXl6WW4wMGFLdHBkQXZiSnFmZG8wZG1XTGRp?=
 =?utf-8?B?NkFOUWJ5MmkrSkRkY1NPQmNXWXgyeTJ3cnA4MVg0Q2FCMXRLK3Y5eHc1Y3ho?=
 =?utf-8?B?M05VVGRoVksxR0N6RmZOQUEzNmUvY1hNK211RTUwVHU3SUgzOHNXckVMWkdO?=
 =?utf-8?B?MU5oQVJnbHhQV01pcDQvTDV2aktzTUJWRFk3RHQzSTVjc1ZEZ1BkVGdQRHd4?=
 =?utf-8?B?VEVHenJNbmYzSW9zQVM0T1hJT3N1ZlRQcGxCOU0zWWRZTmt3cDQ5TnBMdkp2?=
 =?utf-8?B?R0RMVmF2UHNBQ2FaWHAwaGFRRndldHd1blloR2h3NXM1S09wZ3J0cklFUXN1?=
 =?utf-8?B?TFBlY1pVSE1sejNxSWRXeVZiekhnWVdjc1hkMC9OeVVxTUtmckNKdXYzWU4r?=
 =?utf-8?B?YzFVeDZ4UjNQMW9LVnRML3F4OHBCa21wNitQcE1KSjlpMzdhekxKSVZOMHZU?=
 =?utf-8?B?ODUrVnZPWWJNS1VhODRkNUVYdXQzWEtuV0p1N2hOVjNhTXVzWjlUOU9wRDJD?=
 =?utf-8?B?bnhmdEhIekN2UlZDVEFQU09TOXNvT2NMRzNKZ2FlcDIxZGs5UG5hQ2FEZGhw?=
 =?utf-8?B?dFd0MHVybDZTQkczb01taE80Uk1UbEJPUy81Z2ZHektoeHk5SS96eDZ5cHFW?=
 =?utf-8?B?by9LaEg1L0hVZ0YraDZtK3NiNCtpeUVZd1Bvd3dwUys3eGNGR0RpZUVTNlRi?=
 =?utf-8?B?RTZtV3ZEeTFaT25CVnROc2xvUGszcjNlREczak5NMHVyTE01cVV4Mkswa1RY?=
 =?utf-8?B?enRtY1RIbHQzSEZ4OUlTSHBJMlpSZ2lwTVdTM2pEbFVVREpqT2czUlVrdk1T?=
 =?utf-8?B?VWxMUmJ3M052WkMyZ3hvNDJ4M1VJUVlpTnEyRVdFemFxYi9CaWRoR2U5Y09l?=
 =?utf-8?B?WjgyVWRwcjNpV3ZDd0RKZUZnSmR6c2JjQ2R0UUVqL3hnSW81ZTJNN0tDQTZ6?=
 =?utf-8?B?ZUVDWXB1ajhiZTBpd0E1R1kxbFUvb3JXWlNmVi9CdldQQk1nZnhEYjBJZWZM?=
 =?utf-8?B?eU4ra1ZSSFBUL2lSWldvaDNYQnZFcVJMVzJQZWVNU0Y4dnlTdmxUM0hTcFNO?=
 =?utf-8?B?T2tCVkpadFVpWHFJaEJERG1RK2NMbzNEeGxPTlduQkxVT2VRTTRvMjc4ME04?=
 =?utf-8?B?RUJETlFBNXhoQWNMVnplNStNZi9uVXhTalJOZGxZQk1yK25BMXR6NVpWazdY?=
 =?utf-8?B?dXRwY055ZXlXRUhrOUVacEhFSzJjN0taMmFkM1Y0Sm5sRzkvWldxY3J5N25l?=
 =?utf-8?B?ZlhiWVFsT0JQM1ArV3lJMkZzUW9WbWpUTElCUUhTcUV5WDZBMDg1OXI4SzNZ?=
 =?utf-8?B?U2RTYURKMGovVHBGOGx3SVgrUWFSWWdPRzJpMmRKWE1HUm5zb01JSWlBSnVV?=
 =?utf-8?B?Smp1dGtUd29hMGswVTB5UEVPMk1ad2cwdmVxWG1Hc3JCNkxqd0l2NVhjdDRn?=
 =?utf-8?B?VnRGUjY4enEyOEZQR1kxa21zWEFxU3RLRnZOdEd3d2FrODNDVjl6b1pDMXgz?=
 =?utf-8?B?eU1ZcDZENjQzbDNEancyMkhsN3c2MzhhK0djeCtxODg0bDUrNFdtZVFzd3lp?=
 =?utf-8?B?TUk2UlM1dVF0dFFPUjRKN204TWd0SVNIMHlVbk5nL3JYS3JQbWUvMGRVUUZu?=
 =?utf-8?Q?Pn9tk43e4qStXsxAwdEPVO2po9P4lkqz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S2pHUWQwSCtjTzFoK1paZjAwT09yNXlBenhtbjQ0amFhQWJqUUFrU21DdW5s?=
 =?utf-8?B?OXMwY0lqbFE0bU1tTTgzbHdvdm03QWdBMjhZY2xnRHJEbE5Velo2c0gzVVkv?=
 =?utf-8?B?Q0l3M2owWVZxSzJGc2h3UFJRMUdvVTl3NkhlOXhvL3ZtL0J4NkdONWFPdmRl?=
 =?utf-8?B?TnFGM01mYS9pWmYyaW01OWc4MzNla0tWVDhzWWRnRTVmRHVHMUVWZXlaTi81?=
 =?utf-8?B?amhMeXlyVE5SWnlVYVlPckh4WGVDZ1hTUVU1V0QrRjNjNnZydWZNR3hmVVBr?=
 =?utf-8?B?bTNuY3NLdkFsUjYyK0lPRjVkbWQzMnBIcUw2ZGVmTmgwaEplTUJPSzVwTDFD?=
 =?utf-8?B?UFZlL0FGVVlPd3ByQmVmTGpVRE11VEJXSXlnZEhXTUdhY1hqa3RCVVMyMlls?=
 =?utf-8?B?MVRlcG4xZ3RURndYVENsdDhHZkwwSlBGSGxqVlFUampscEltU2VUQmR0c0I1?=
 =?utf-8?B?bFQxaks2VkRPMVo0Zk95NTl0K2FIL0FreXgvNzdlZzN5N253UUltM1FkdTNB?=
 =?utf-8?B?MDI3ZWd0MkJnWHZhZUUrTkphNjVncVpWWHVSUm10VTZtWVVzVFh1NnEzempH?=
 =?utf-8?B?ZkoyTkt5K29VVGRyY0NRcVVUMWFWTVh2aTJWY1NsbG0rNVI4MU9UWFJQWTZP?=
 =?utf-8?B?TTVnRGt6eTN5RXFTeUxobTZpS3BVazhLV3RUTHMvUFdGY1FRN0FqbG50L0p5?=
 =?utf-8?B?Rkh2UVJURGlaSG5tcytSRkRhMGdmejNWVDBod0piR1pGb0lrN1lsQ3YwZkxz?=
 =?utf-8?B?YTV2UHZJOUtXbTFqaml4dEQrRzhEYWx0WGlybmcwTlBhSFE4eGk1L3JEc2dV?=
 =?utf-8?B?U05pN3k0bjNZY01uYTFDY2YyU1lmQkYyZXJjT05Lb2liRDhjVVFrNWJnWDhY?=
 =?utf-8?B?bnlZY0tmZmhtOER3akkwWk1aUjYyM3pNc0FUaXZqMHFGQWF4VFd1Q2V4Sldv?=
 =?utf-8?B?ZnIzMHJrYWlLeEZXM3pHeE83eElSV1I5MU1qbXNsaVVaLy9VSUFBZU1FUHdm?=
 =?utf-8?B?SWJEdmx3TGpLbEhJV1A5YXErenJGZ1ZCUUcySW9scWxuVlpDRUE5cUdlRnEr?=
 =?utf-8?B?dXVYc2psZklQa1dQVnRqWXBMMzZhd1JjRkNmZnJzRnllWU5BeE9vWnZQRGZy?=
 =?utf-8?B?MEpXQk52NUpCcEVlSzBTZGVWRWFWYkRMVUdPcmxvckpZQXo2VkZSVmlPM2tD?=
 =?utf-8?B?WmNsVDdjb0pLaTl0cDQ2L2JSTWIwaTZ4VnRIcGVPTlR5TzhhMjhnQmVnYWsx?=
 =?utf-8?B?RmkvU0l1elc2Z3JVak1oSFhIeW5hN0IweHpDMXFIUm5jbGRIVGVKTDBwbVBv?=
 =?utf-8?B?QjlzM2dLaEdRODFGOXp1R0dXUDludzRnUmJUZ3pvZGREU1ZBU205T0hYVkc5?=
 =?utf-8?B?bEExdVgrYnBjckV6aTRON0hmdlFUNkp3TkgvVml3b1Y2NmkwbmFqNG9qM3Ra?=
 =?utf-8?B?Rm10dFI5am9va1drbXBndmtLUksyNVhTY3NqTG1JNVNteWhpMFNoWGYyZXFy?=
 =?utf-8?B?dm82aGsvaG5GTU9YYkFUWnJZZTAvejhDNlFEampHMFZzTUpZcmhyL3FBamxJ?=
 =?utf-8?B?b2E2WkhIaUxRNHUvRTJLcnF3Qm9Wc2pUS0NBNkh4R3VQMUhNQzdHZm12RFhZ?=
 =?utf-8?B?SVQyaHN2TVdGSlIyWDJmZEF0YndzcWg5NzNQZUQwaFV2SzJackRlMGNhTFFz?=
 =?utf-8?B?YWJGeGdOdmRmbjNqSVUvUm5PNWxhVXJnRXFLTG43aHROYmUxcnlUQXZmWFcv?=
 =?utf-8?B?Sjhrb1E0TE4xdWh0Ui9FUEpTU3hYeU44K0poMENjUWIvSTFYTE03RHZBd3JW?=
 =?utf-8?B?MXI5QlV3T2FPNFdSRXUwTWV2bEpzajdGVjhiU0Q2REZaSzNJVHViWm9tczda?=
 =?utf-8?B?L3cyM3NMZHJOejM4aWx3anY5Skxmd2JVaCtaejFSdk5peTFUL0Q2ZG1KcVNq?=
 =?utf-8?B?TzNPYlBuOHlETFNhbjdnSkpqdzNKUnhHRHU1RVpuaklDOXA3V0ZMWTZyTXR1?=
 =?utf-8?B?ZmQ1Lzh0YjRIK3NzdEZoeDRwenptUUkyM1pSNnZ6bzZuQmlnSXQ1ZDZHcG83?=
 =?utf-8?B?R2VYbUI5MmxmL0tzNVcrT2tPK0dVV0lzdlJQWGU1aUl1Z24zdEhZS05xa0Iz?=
 =?utf-8?B?OGxVTzZJOGVybWxTSm1QMHdkRzcrTGM4Qzk5aktGd09qWitOMFZLdExtU1lv?=
 =?utf-8?B?UGsyajJZTGg1ajBxQ2t5azNDZ280NmpWdW1rcVhvMjhHc2dsNkpVUDJvbVJY?=
 =?utf-8?B?OGRYWjR6cHk4a3VxclNnck9COWRuVHJNL2EzdG5NZ0dnZW9zaWt2UU1La2Fs?=
 =?utf-8?B?MXYyeDJGdzFHMWN6UkJOVWVkVEFMMDUvc05jeFJ2WmlUSVFEc3ZHUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7507751d-b260-4909-1df3-08de51dd5acd
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:20:28.7129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKZiRF+FJ+HafeYoESiG+mE8NeNsRHv7D9BP8mVZq8DBXixWXEuQkkXP2cmEb8Fy57lRYKIpXp7Vaz/yKO/+fE00GIPb4MGCh39tw4K5KXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10627
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Jan 2026 13:20:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8455

Hi Antonin,

On 12/22/25 1:27 PM, Antonin Godard wrote:
> Add a OCI_RUN_EXTRA_ARGS env variable to allow customizing the arguments
> passed to the podman/docker run command. For example:
> 
>    export OCI_RUN_EXTRA_ARGS="--env=SPHINXOPTS=-W --keep-going -j1"
> 
> To limit the number of threads used by Sphinx. This is especially useful
> for parallel builds.
> 

How about exporting host variables inside the container? That would 
allow to not have to add OCI_RUN_EXTRA_ARGS when comparing native with 
container's output.

Something like

args_run+=(--env SPHINXOPTS)
args_run+=(--env SPHINXBUILD)
args_run+=(--env VALEOPTS)
args_run+=(--env VALEDOCS)
args_run+=(--env SPHINXLINTDOCS)

(not tested).

Also, you can already do that by simply doing

documentation/tools/build-docs-container leap:15.6 SPHINXOPTS=--bla html

for example.

FYI, I've realized that our "which CONTAINERCMD" doesn't actually work 
when you have podman-docker installed. I had an alias in my zshrc 
setting docker to podman directly... I need to figure out if there's a 
way to detect whether podman-docker is installed and in that case use 
podman instead of docker. The user mapping doesn't seem to work though 
(using the docker configuration in our script, with podman-docker 
installed, so effectively using rootless podman but with docker 
arguments). Seems like the owner of files within the container is not 
mapped to a host container (all owned by root in the container, which 
seems to be the default when a user id doesn't map to anything known on 
the host).

/usr/bin/docker is a shell script exec'ing podman with the same args but 
the naive check on whether it's a shell script is probably a bad idea, 
as nothing guarantees it is a shell script on all distros or that docker 
won't suddenly become a shell script itself.

Cheers,
Quentin

