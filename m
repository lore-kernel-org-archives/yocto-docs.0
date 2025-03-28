Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F26C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:24:07 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.64])
 by mx.groups.io with SMTP id smtpd.web10.11054.1743168236648074651
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZfZzc8YV;
 spf=pass (domain: cherry.de, ip: 40.107.104.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELiWOU7fUyvcjzYeftCKdRE3RyYQCtIVMPUtNSHNodBYQFi9RADLnYjCacakEiMKpmCtvQgHbM4pIG8/RmKTUV+GaHrhRHBzWVjCmjA8mSimPWl3crm1AOyZ2VGhfl455bcx8M4Xgplns1ODNU94YL1wxkLwM/mg3lgs6Nhwtv0OcfB+30/ZE3vNqdwfPGn2c/VDo+FL75LKSQto89SoKR6WtDajrHsWw9cahXjEGil95lqjSCS09hQybIOn3ZpuGP09HmoQn1Qo+adYC7eubFGwKNljBJ9GAe1lQU1CmQ9bNnipxI7zWzTn2THdALpIqoMbEdKRcBWhVoahdmV29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GU2WsjHbuFtX37SKZuBcQR/+xldT6hZsbD2Vf2LssuI=;
 b=IGgzmmEIZanmRgOj1VNDI8N6NUHxCHSgRn+HGuJjq/ecGM5QqFjybE1ShpWEm0X+yXvcHLV9mF6XZyPv8PDlAjbpzdBr0x6WfniY5UgFhpCfFcyi3anBeLAyMCR3OupEESSYdDdrRn37gOx8TUmzgLbvvXh7wv3Wws+N2f1e+9TOPQMc2FU30vj6Oj0WvToopdLThCvME8YIpSBMqkgXBGJH+aVfk2mTCRvWxNpUDyWOEpWndm5EJroS2r1c5wFZH4HEILF73x2XYU/KxDprX9Hnhb+4HoZrL8OBPipmVAztZEKTupow5xjIubz3niF241w1vFr1jZOX2Z8QsVI57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GU2WsjHbuFtX37SKZuBcQR/+xldT6hZsbD2Vf2LssuI=;
 b=ZfZzc8YVrv7tmPhCFC8MH4jopv2i+U0Jwa+vxIWnEh7pCANt6+ij5O+3erPcSrsIOze/rAOVJH2Ha9vbVqJ/f4+raHiCS6T0nbKRwDrv6JbrfCV3nTh5/TumhXIgBYKNG0OLeT7E5lZfXV3btZhPc9uEgwTozwWJsnldNZ37lTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB8361.eurprd04.prod.outlook.com (2603:10a6:10:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 13:23:53 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 13:23:53 +0000
Message-ID: <0db66ee7-9528-4724-b800-0239dcb3cf8f@cherry.de>
Date: Fri, 28 Mar 2025 14:23:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 2/6] ref-manual/variables.rst: add manpage links
 for toolchain variables
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
 <20250327-cc-vars-v3-2-742dbddce008@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250327-cc-vars-v3-2-742dbddce008@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0340.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: 78534b59-b6fa-4ddb-1cec-08dd6dfbc8cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MVJpOFZ0NlUzTlM4c0pFS2dISVkzR1hvbXI2Mm4zaGJyYU9raElJVGtQcFNO?=
 =?utf-8?B?QmFlcFl5NDEvK015MjAvRFpxR1Z5a055V3pVMFp0VENBd2ZNSXBIUHJpY0ZL?=
 =?utf-8?B?U0tiSkZmV2d6cGFQR3ZsOHZlQ0dpWG9DQXJ5SW5lRTFUdHV6VUVNZU5ERlJx?=
 =?utf-8?B?Y244ZlRjMFpiVVdlVndNYngwZXNnMmNIc3JOMTk5a05wSjFsUllQUHdOUmNN?=
 =?utf-8?B?YUZ0R0EvbWFiMG95eDVSTXBnYnAyZklEeHBjT1d0RDhEbkRQSUJjVmxzWGcv?=
 =?utf-8?B?QWx0V1BLZ3c1alJoeEVkMkNtRDZueXhTSmwxRmx6S2ZoSnhhZHZVdkFSTkVH?=
 =?utf-8?B?REZBNjN2dXNBN3ljeHpQYWVGQ0NXM0J4SmJCTzZYSyt0dlBQS1ZCQytreVZW?=
 =?utf-8?B?UzJCNG9uKytod1RsSEpudkZ3MHgrYTg5TjFFbUJLYjZzUExGaVNVM0MwcG5m?=
 =?utf-8?B?WnFMeWZJeUhubnd5NFRkWnk3S1VIcS9KVlhnd1IvU05BMENUTUhyeXVxRzg0?=
 =?utf-8?B?OTlibFpnZDFGMG9zR24ycXV1OVZVdWpKNDYyVU9mdzJjN0libEZtUHlIdk5x?=
 =?utf-8?B?aEQ3K3o2ZWFrS2I0eEVTRll6bEZSMzNLMXVITU9ydlJEUVBKdXcvd0xudkw4?=
 =?utf-8?B?Q3lSS2R1eGZkeVNFYVROMHpKaGwvU0hmN2NyT0tSZjRDVU5TYkFPWU5CK2Z4?=
 =?utf-8?B?QWw2R2dmUXdNWE9lYzBMSFhDeTN3OEpBQmFub3JpWFFQTmJySEhGRm1Kbm9T?=
 =?utf-8?B?Rm9kaVNsRXAyRmxJTkpRdUFSUUVWN29jL2ZyUkZtUnl4T0xDRHJXTlV4N09m?=
 =?utf-8?B?Nm4rWlhIZHdrQzBLZkEvMzlnN1FtZUI2dWtPaklJUlRPVnpRaC9NTjRzcjI1?=
 =?utf-8?B?V0t0TGdub3NyT2dwMVJoaGRKS3Ntb0FQbFNQejIyNDhyWHR3emkrU3RzTTdo?=
 =?utf-8?B?bHFPNXo3QmFtSXZQSVNQNnhjTU10a2dnTG1nWnpYZmFnd3QvT3ZHZTFqZVdo?=
 =?utf-8?B?azRkeVRmSm11bjlEckMyY0hBRENqMnNmU0Q2UVFIUnIrZWEvYk9zMm1DQ2p2?=
 =?utf-8?B?Um5LS3JrUmQzbE5TeC84MXFxbVFoOHRaWFhtd1RYUkdUdG5mY2dnV1R3dTk0?=
 =?utf-8?B?SlVmcUphNjFRbDNXcGZROWhHNzNRV3c5MVViekg5OFhGMldZYVRpRXJscGp4?=
 =?utf-8?B?TWswSHdrcjlSbGUvWHM1SlkycXRpYjJrZXNudE52MDZWZXdJSWtxTCtzbFUr?=
 =?utf-8?B?eHg1VUFDUVEzNlp4MFJTSW5mRm1ZQmtYRXdCemEyMElUQmFoODduYW5NT0ds?=
 =?utf-8?B?U3AxWVNFSHJ3aVJTUzV6ZDhWTW9ldkpRam9QWldYSHUvRXJZVjNnbjczNEtX?=
 =?utf-8?B?T0VoY2JTOU0vTFM3azRPdTg1YzRBa2xmSmlPb2VHaGUycVA2eStYa0ltTkZB?=
 =?utf-8?B?Vm10Y0J3NytoT2IxUWNNUTFDMEFyWXN0VjJWN1d1aEtlWTFEL3BWOXdPVDJW?=
 =?utf-8?B?WnFOdGl1RkllSElIWlZVYVNHekVlZUFlMmQydXJuUGlKNjJJQUVQWXZtd2Np?=
 =?utf-8?B?MFhjclk4eGdlOHhJcEpFOTFTbEVBdjcySEw4dUl4TzdqSDJzTEVOTnA4NERi?=
 =?utf-8?B?am1taW4xeTF1V1NiUk1lY2FxWXRSVjY5bWJPTlhlMzRLZjJOR3hnczBrcHdn?=
 =?utf-8?B?OThxZ3JRY3J3S3Z1NnBSM3lWb3BpYW9TYmxYNEQ3K0E5VlZ1Z3U0L0pQSEZ5?=
 =?utf-8?B?MjN3TTk5dWlSZEdZaTlmZ21SQk96by9tb1NpeGMvVjZidmFJMnBEU1pVSWdj?=
 =?utf-8?B?eXNTSTJSTkFZWWF3M3NSdWF5cDFUVWNmSHgvUWNINndvM1dDaHlSc01UZHlF?=
 =?utf-8?Q?K8othzcbBH+75?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?amM3VnpDbHJSanBLOEN6WmtZaEtkd3BVVVlvTDVEVTlFUFdrWGRhdXo5aE82?=
 =?utf-8?B?SGs3WFM4YStvVzJZK1BZZ2gxbEV1VVRVUEdGZFlCT3FkTUdCR0V2N1FvaXpO?=
 =?utf-8?B?MDlNNi9qNFpzUElUbmZ6MThlYk12bWRNUlgyZnpEcll2VDVvbFprVnBDcUJ6?=
 =?utf-8?B?bDNHdXplYzY3N0JQRGpVaHpkc0xVVFFLeS8va3U0ZVoyT1JmWktPTGJiYTlv?=
 =?utf-8?B?NWFhQ09ldVJzQlBLU2NNcnRkeGhLZnR6TkZlT2hvUjhtc0ZiVEthNTJybFZF?=
 =?utf-8?B?T0h4YUlaZWFnK1RLSVI1b3FUOENwWmJkRnVUUTlqbS82TVV5R0llT2xDVThL?=
 =?utf-8?B?alpHaUJIMmZ2VWl1dUVOeUVhVnEwL2JvMFJJMEVaTWhLSndjcC9RZktIQm44?=
 =?utf-8?B?L2FyNVlVcExzVHYyOFZDRlJJS3hnM2NRaHg0bldMOGcvQkVaQi9HbW9LTnhQ?=
 =?utf-8?B?WEI4MSt1QzBIM0ZmRFhxREJ2NCs1NGdVdXZOQlZCUDNlZjhXdmFCVEhwTGVE?=
 =?utf-8?B?Y1RMaVBnZWJ1K2lsb0xDbURLYmp3UWxOUnBmekRHcnNSNHpJaDBxbGovU3NB?=
 =?utf-8?B?WFkyYm0zM1Ivd2RjdU1vbFAxSWMrYnAyWk5ua3pUTXVIUmVrWGt5NC92WGpE?=
 =?utf-8?B?M1FzN2p5V0RNN3o1MXArak4ybGFMVkFoUGhLbHNQQVlSZEtqTS9OanZtaW94?=
 =?utf-8?B?MkNHNE5JUmhYN1BINWhYenhNSGZLTEtCcHZSOThnRklvekJ2Qkl4YnNnODdw?=
 =?utf-8?B?U1FWbVhabTd2NW0wVk0zZjdETlhzbWx6OEVRS0MyblBNQzVKaVRtbFFKUW54?=
 =?utf-8?B?UnQ3VWtBVDVLcFpnWk1oRnUvdmdwQ1llMHhUYWdjNFJvNHQ5MSthVXRpZ3FE?=
 =?utf-8?B?aFlaZmNWbElaQTlkUW9zazA4QnNqeHBDZDZHRkp2eVIrK0hrOCtlbFpLMlg4?=
 =?utf-8?B?ZjQ1RXJnRmVqRkxibFZuSkxjdkhXLzBmdEFhRlpkVHpSdG9hdnpTQVd5MGVX?=
 =?utf-8?B?Q2twaTI1b3kxOWVmSGkzekd5dm1uTXFlcDlHeE5uZ1hMT0g0Sk1iOWYwbEhF?=
 =?utf-8?B?TUQvVDRSWkNNSHV6RzQ0Y1Nnai80TmhRQWNHWVh2d3JKV3d0dGMyclpPcFl6?=
 =?utf-8?B?M05lTXh1dHZ2ZVkvNlhRZzNrZ1BsYmtqM2JiQU52L0tkLzJwaXMxMWVEYXZ2?=
 =?utf-8?B?ckxpdldKMlhNVlNTWEJ0MDgvdmYxNVRCVmZTdkg3R1pKbi9NdkVnQ3JkWHVj?=
 =?utf-8?B?NEJDdzdRM1F0Vm9weEdYMmowdGFyL1YramhDbEZ0bWJ3WHIwSTNJcFdNQ3VI?=
 =?utf-8?B?eXFyaVBCZE9IUFU5dmp4cm9DVjNsSnFkcHBRK1FhOFhtMHF2bHpsNmxSZFBB?=
 =?utf-8?B?Mi83Qkw1di82Rm5NM3Zpb2dYeVNyc3Fycmp5RlV2Y0liWndndE9UT2M5KzZV?=
 =?utf-8?B?Wm1ST3BFM2plbThJcWtRV215WmFCTUpnT2c2QnhkRnRiZVpXWFpveTJvamtS?=
 =?utf-8?B?bjN3VU4yUVkyWjRRYlhtMUY3L3lUVDFoMEZlNlVpR0haMDE3UEhLL2RuWTlF?=
 =?utf-8?B?aXhVYzZVZ2dzNjJ1NGk1djVPYTQwZ1cwWFIxMVpTdFdtL0lBRjUraEFQZG9C?=
 =?utf-8?B?WURUQjkrT1pHanFWdnJNYS8rdC9pM2pVNnpaeWJxU25ISHUwazNxM0hqV2g4?=
 =?utf-8?B?RzJzTlF2UHYwbXBNQWIrUzdhMmhlKzJIaVVtSk9qUEM5NGd5RUJESzB5K1I4?=
 =?utf-8?B?anpGdkpibG53NXdZNWoyd1Y4OTRUQ2x5bWZEeTh0ZTduU0FJNE4wVmw4Nyt0?=
 =?utf-8?B?ZHV5aExmZU85bDdsWk9neEpidUVmekZ4UUZiYkJ4azNKOE15b2JvK29DZG8r?=
 =?utf-8?B?QVpSbE05ZWQyRk0vcTNCdHJmR0RjS0tGWWVsMEpkRlliZ083QzBOWnBTNkF4?=
 =?utf-8?B?NkpQVmt4ai90TkVVc3owaXN6c3lDVXFUbDR5M0V4eFFyVDZmMHlOdWZvWHJX?=
 =?utf-8?B?OGptRUVpQnR4Qk1kd2JiQkdMYVMvYTFyRitDM3VhMkdnQURLaHZ0NzVLaDlP?=
 =?utf-8?B?K3VLQ05vbDMyY2ZyWEhZQVBMbjE3VlUxdXpZeEx3Y3BYOEJhNEo4RmNwQjRT?=
 =?utf-8?B?UHV3WkNCQUx2dk1oUXFxcUluK3lac2NMSVRRR3ZyNSt5Z1orbkFhMjcxMEhh?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 78534b59-b6fa-4ddb-1cec-08dd6dfbc8cd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 13:23:53.1846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dc3wvyyUDTwYocCegNv3RVEW9fxduiaAhkC18sBe6ahq8M/VlLQcbtRJQoWFetpcbUmP7310NF1nK4YT55458ZyC57VvlM528Ss4ZYdxuS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8361
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:24:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6668

Hi Antonin,

On 3/27/25 10:07 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Use the :manpage: role to provide links to common toolchain utilities.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

