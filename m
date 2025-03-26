Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B0AC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 14:54:30 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web10.24614.1743000861442907265
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 07:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Eui4/rKu;
 spf=pass (domain: cherry.de, ip: 40.107.21.77, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1797BadDyiGglHVBlsWnKDSsaqDHT/+sCE2I8TpCrJFBm9qiBqM5vxufN6hCwm8FI+30xrHD4VXomitmYnyJJ66+NunmeuFn2VZzXFFQVZlw8QA5LA00qvQTpTOYOLPsfrwo0b0+E600ZYcoGIapG/9Z0jUwttH3l3559MpLxLbwratdw6ACfYAylLrozCi1WqjJUuYd9HbZhmpPisrz1ATYim8gahf3lnen824R0V8iO4478tGMhgkapFPpfhZrXrx5yztRLTar2PMrVee9p+/X8d6PxQKmsNE1YGl8YVNjYky3pGVRYaMUkASENGnkQ6Jpfx0FO0BKzD+idELjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjbjaTIPTcWq1exkFHnzpcxkvyft5vOXbLwdncu1Wi0=;
 b=Zh8ylpzI6o4j71zPY6dWHs4kLayK6WxU26DYktLrirVneMbevGDHrz19dO31Nu1pJa0Xk1M83l5kvwim3wY+TZoqit1IRjzO8URlWWTYU/fbT34TF1UYT5aeKezhB32gbyEjQJTRCrw4R9NbmNJ5JF4PrBVJxyC7LvJeynCmTXqnV+0sFRZ9alyXXPIE90KTSyfX9iH0HcU+DvnJdmwK6+VATAPnh4k6RIh3F6YMfqScteVJkgO8fP+PCSINBhVC7c3dKsJtIO6NS0EsthAaZkSagu34tsvlTLLoueOjEyaM8bkpxH+S7QXlauXC5jooiYKh4l/SoKeLdJUckL/P9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjbjaTIPTcWq1exkFHnzpcxkvyft5vOXbLwdncu1Wi0=;
 b=Eui4/rKuEN+4FvBOQDq5KJ3zinN+bSdeZRSDkK0Or7TKU4yARCiwGNRbj56ZQmyKscvWWuIDm/W2hHwhNyqdUZ8GjA4Chw8lQGNQz8ng2LOY3WczdHzRJdKEtWbm9JLy4SzoNxmCb2/3l+jXrMEbbX0B0N25LBe18HH343poEjo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AS8PR04MB7576.eurprd04.prod.outlook.com (2603:10a6:20b:29b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 14:54:17 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 14:54:17 +0000
Message-ID: <c5dbd49e-04d0-4616-a2ab-4302e9abb3b4@cherry.de>
Date: Wed, 26 Mar 2025 15:54:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 2/6] ref-manual/variables.rst: add manpage links
 for toolchain variables
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
 <20250326-cc-vars-v2-2-36b80c64c4a9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250326-cc-vars-v2-2-36b80c64c4a9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::7) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AS8PR04MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 4024e6c6-f663-4a15-d1fa-08dd6c761534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?KzdnZ1RkSGxENVBzSXJJVUQ3Z3RFZTFCdkhZajVkUGZNeGpTMkN6Q0NiWW9Z?=
 =?utf-8?B?Y0dqd1ZqNkZISTVxb25Cb0dDZTR3RkVPKzhPNkRKMURuL3gwc2lLV0poOFJj?=
 =?utf-8?B?dnFTMzFCMXlSRVFJOVJhZTBmWWRDTmFYQ0xDK1dJb1RHMmthN2hFdmdxdUlj?=
 =?utf-8?B?QURKZnh2T0JwL0VSUVFuU0xEcEtUUE1TaW0zNVlJMTNSeUJCelhLbVRyZzh4?=
 =?utf-8?B?dWdEa1Z0YytGLzBvMStWVlZWTTUzcmJiTGhIWFZuS1FvYVRVVUQ4SVRhQjR3?=
 =?utf-8?B?czJLUHk1czhMR2d5STlaSllOWFlnak9GK1RuK3A1UWNsd0lPM05oNVI1SGtV?=
 =?utf-8?B?SllyQlFxb2p2OW4wMTdwWGw4SkVWT0UvaVhKSU9naHIwV0x0ZWNMZERldStL?=
 =?utf-8?B?L1o3dDY1emc5MUs5R1VWVDdXN3BVVzRXd0x3R3RzbkVyaTlkZS9TdVdDeGpQ?=
 =?utf-8?B?aFZvVEVyY2ZqOGJKZ1NsVXVmME9WcHdPVG1pUkZxU0RWbWVGdnF5OU9UZjZQ?=
 =?utf-8?B?ZzlQdlZMZDdmR3d5bUVHT1JzTldxaHpMNXVBU2N3Y3BiZjUxZmcyd0ZndlFI?=
 =?utf-8?B?S0NrN0V0bWpxOUkvVXZiVW5iUEE2NStQVmJ4MDdJRTk3bnR5RlhjS1lyZFJt?=
 =?utf-8?B?NS96ejFJUTZjeFBNRDBWUmtFd1hiZDI1SVNYZ0o2U2YybEFSVVFIakhVeC9H?=
 =?utf-8?B?QkF4TVd3bzgvYzVVSS9uWHYzMHpXNmFWOU5tMjFiMElENGxBdU02dHZYQW9L?=
 =?utf-8?B?ckZPTlFKM2xHdGtLWVFsOUF1amg0OGZLd1ZNVlBOT0R4a1hGVDlXT3V1MTJL?=
 =?utf-8?B?NU5uT2k3RW15ZVdpUVZPQVNjUDI3UCtKblRJNWozdVl0K3RyVDA5VzUwMVoy?=
 =?utf-8?B?cXdJbkhFU1M3RnpLVUNMYUtPcDBkdzVtS2ZqcmdWaXFTeU5YdVJMc3lLdW5N?=
 =?utf-8?B?V0UxTW80LzVLYkZjbWVRYUx1NVlzMGdwakFQakg0d0N1clRLWXc0WktRQzN1?=
 =?utf-8?B?MEhkcmR3ZEhSSFcxeU9SUlg5d01acVViY2VmMXpVMWR0M3dDRXBBWGhGaU5j?=
 =?utf-8?B?RkVhWjZ6SjlxamxLdkt4RGE3WmZlNndySHdRWWhUa3RGWFlmTFpiclNER3NR?=
 =?utf-8?B?RUFNbHAwbkJabGZJczJMMC9UeG9oc2taWVVsMjZWZTRTVzFIa25VaXVwcThC?=
 =?utf-8?B?N2g3S1dpQkFyNm0zVTlOWEdjeHQ2M2YrSFhpdzRNd0JFM2pGeHllaXJMYi9S?=
 =?utf-8?B?YnVyTXpscWNIQ0RGRmlOQ3dRc0pIaTNzY0RJK2NEZ0g0Q2FlcldMZk9Ec0lB?=
 =?utf-8?B?RVU5eWhlVVFlakZuV3ZPdVhqSC84MUpmYXhGaStwTWNCNG1hY3V6NWFSWVBF?=
 =?utf-8?B?L1NzU3YwY0U2eVhaWSt3cGwxOWh6WTdhV24vb2RNMmU3ZmszZUNLVVNxbXlT?=
 =?utf-8?B?bXEwRGJvNWJ3TjV6MmxBd2tlcDdYeGhRMEMzSGlQOFhtaDVBVE50cXBOMTZF?=
 =?utf-8?B?MUIzZFo0TkEzTEpWYmZpRDlKQXU5dU5xMEJ1RXFsenJaYlhKQ0tMQ2pPdWFp?=
 =?utf-8?B?QjlobHBsdzlkdDVkNDdzeXQ2dHhDWTJ4OGRqZU5vVVhqcHYwUXNIbnhDajVu?=
 =?utf-8?B?bW04MGRYU1FaZjZiQkdhUVdSeS9YOWxma1FjamcrMUp0QjVxTmsrU3hoTGZK?=
 =?utf-8?B?Wk5SZE5xWVNRR2RJcG5PUHhVOGJlWFNjWFhuTmVBQ1UzcnlNK0w2WVgzV2hK?=
 =?utf-8?B?UFpQaFNOMWRhT0lCbks4UklkUHFIYlg2R2VsYVFURkkxMmQ5VFpwdG9LV2Ey?=
 =?utf-8?B?b0ZqYk93bmpWRjlHUmYrZWZWNUpsbjZMUnIrMGY0am9rcFJwdUQzcGxrK2VM?=
 =?utf-8?Q?faftOlyXKELJo?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QTkvSFlzTlErdlhWR1JTYXlLY3pwNzd3RjhyUnhxL1JJV3lUeXNuRm5hMHVr?=
 =?utf-8?B?WHViVlhVVXVnV290UFMrc0owRWtSNE1pcmNEelJGN0xUUHlkbjJvSVpPVFRR?=
 =?utf-8?B?ZHRJWHN1ZEFUanh0aU94QXp0ZFNheWt6SU1tdW5IbWJqSHp1MHZqbk5Dbmp5?=
 =?utf-8?B?M2w2ZWF1WTRDQ1hvbG5mUU10QzBya296VkFqb1o2eUQ2TUphbU54NVQwNTY3?=
 =?utf-8?B?eTdpbjF2RTZPakFBeTZyWEFqdWZ1UEFmdUhGanZub1l3dUFHWXdyN2JGV3la?=
 =?utf-8?B?aDQyZ1ExejJHS3U4Y1VUWDNPWmloWnpMbXJKeml5dUNRY2ZMRElZL0ZUZ2tx?=
 =?utf-8?B?MU54MHBTQmd3RFEwSWVrOVUwa09rakozNEMvdFhJdHAwa3g3UmJpT1RxZWFS?=
 =?utf-8?B?TEhyNmtDcU1jOXIzUlFoc1pxeEd4VUxjTHA4UHdQMTZTWGtySUFKdkp5NFd3?=
 =?utf-8?B?ZjNHbkVSRS9JVXdnakF1YlozL2l5KzdLSXEySTlMd2NtZEw3OFl2bGI2UzFZ?=
 =?utf-8?B?alNtKzFnTTBrWUw5ZURRUVNOOWZCdEJsNVR5RXluMSt0U3ZtY0pNOVFKTmkv?=
 =?utf-8?B?ODRsdE9BeUh4ak95cG92ZmhWOFJJcVRTM1dMM1dlSHgrL3R0Y2NkQUtKY0Rx?=
 =?utf-8?B?REdQd3UyV0p6bndlVjl4T2RibFJla25pR3FNdi9XVTYyNzZEZHYwL3E4Qm1o?=
 =?utf-8?B?dit1UXJaRjdpd05CSldEN2Q2bEc5NldUOGhCTWxVRlRmcklMS1lIcUtwcHBS?=
 =?utf-8?B?bURVQWtTc1Y5SFNrNUZBTi9YOXVkV3RMenRWUnNzVUV1OUxLT29hQ05uaDhJ?=
 =?utf-8?B?WmpNL3NKNzJiUG5WYkZjQ3h4NnI2bHRrSVVRVFgyeHlLWjZHWmxuY0RBL0hB?=
 =?utf-8?B?cHRNV3B5YUNKM3luUU56N1E1WUdwVGxsQTdWeml3WE5sdmdoQ2pVMmZTR3g3?=
 =?utf-8?B?Qlh6bytrOE1kdlMxYnpoS1BlbUthdHRkd1BGREszZ1lXM3p6WlFkT1pZTjRr?=
 =?utf-8?B?S012eVpBczNtSU91SW1CclJsYlk0TU1QYUZPRTNKZXVYQnhnZm5RSGVSd0xt?=
 =?utf-8?B?dUQ5SXZyMWZlQnIvaWVnM1lCdllrUTZ0NmR0SUJlRGphUzVvSDcvbDRTSXVq?=
 =?utf-8?B?Qk8wNUdzRnJQR3UxNnVWM213cEJ3bGphS3ByUUZTOTRzWi90WmZJNnNON1BY?=
 =?utf-8?B?RWFEVFU0YXlURXVKOUtTa0QxOWIzVjZyR2p4MVEySWxIZHRFci9IUEc3M2ZW?=
 =?utf-8?B?QUdhQnNnWEVlUkk3UE1mTEUxMmFndWhqK2hTekkydk9KelI3TllBNTQwM3F4?=
 =?utf-8?B?OEJRTGM2QzRGR3haQzB1R3l6V1d2Ykp6ZmcrTEtnSEVWL1ZQd1QvQnBxZU1H?=
 =?utf-8?B?Nk4rc21qQUxLT0ZmaFJTdnJzSit0TWlOdlpLOEFYM0Z5QWE2MTZ6Q05rVk9B?=
 =?utf-8?B?VW45YUxCY0RyY0l5OTYwcUNqSkhOQk1BaUViYzVsTkNPdW1waWovVTg1K2sw?=
 =?utf-8?B?QTc4NG83c25YMDMvbUkzYkgvS1ZvMjVEWjhTOGUxMHJGaHFQL0h6eEdvakJk?=
 =?utf-8?B?eStCMzNRWG83QXFhVGRBdDdwa0FLZDRZNEF2bTFFU3U5ZU1vTGMwTnErbnlQ?=
 =?utf-8?B?NXRYNjZOMHptWjdSdUY0bDVRKzhFRFJ5VTQxRVZJSE5HZ0Vla1NlNWF4Qi9D?=
 =?utf-8?B?ZWFjNlBoTGlqTFZnamJ0Y1ZkY3hjbDNVWmVpSnQvcTBtTS92SVh2YXZJUW8x?=
 =?utf-8?B?RGtYbG1QZWpTeGJjeGNRY3JzWXV6N2JnQTR4YWxkZlZ5dCtRV0tWaTlhUXRC?=
 =?utf-8?B?dGV2blc2MEFVMGM5R1VnQjBkVzFYMndmWmdvc2xmNnVjS2pmbkFnTXNsVUsz?=
 =?utf-8?B?bUF2STQwNkVFSGdMbjBTSjlyZ09BY3AvT0dIaU1zUE9QcktpZkhrU214YW9S?=
 =?utf-8?B?cmZkVU5pL2ZjbGRRcXdyU3dVeG5nQkZwRFU2dTdXSGgyOGZsa2l3L2k4WFdm?=
 =?utf-8?B?TkNvRFRCbmpRTDRkblFDN00wRU1SRmFEL2pGci91SGZaSzFpaHA2VkdpS2tu?=
 =?utf-8?B?SGVBeVV6L0h4L3JSVnlkVHIrZ1FOdWJhZG9kTmNLSllxR2NZTDdkZTVyRkFJ?=
 =?utf-8?B?QVVuSHdZSy8xbWZrVjZqaW5NaHNzbXhOdmR4b2lLcXk3TUVnakc1cVA1Zmlt?=
 =?utf-8?B?S0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4024e6c6-f663-4a15-d1fa-08dd6c761534
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 14:54:17.5756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0k1gaaQafJazHMABe3a4+xl2ZahR+oAyQNHEnbTl02Y27No4jrmHeEYgE57NPQc+CiISI2RBYF3whG2liXVIPg4RCCAKKjFBzvAiuAv2jh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7576
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 14:54:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6642

Hi Antonin,

On 3/26/25 2:21 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Use the :manpage: role to provide links to common toolchain utilities.
> 

Should we specify the section for each?

> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 2b31bc7b0..ccb4e0de2 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -143,7 +143,7 @@ system and gives an overview of their function and contents.
>         information on how this variable is used.
>   
>      :term:`AR`
> -      The minimal command and arguments used to run ``ar``.
> +      The minimal command and arguments used to run :manpage:`ar`.

i.e. :manpage:`ar(1)`

but maybe we then want

:manpage:`ar <ar(1)>` ? to avoid having the section in the text in the docs?

Cheers,
Quentin

