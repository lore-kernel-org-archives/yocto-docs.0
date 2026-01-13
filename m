Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0FAD2D11D
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:49:23 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60433.1768315759831259924
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=N+rFkWhn;
 spf=pass (domain: cherry.de, ip: 52.101.66.1, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbZ+07ZLnVKQd65YdsmnRZtFqjNpyto5JPEEZXA4XNSkNhBC5PXTTq8GnyQEgbwHGOsi9C7AYDkeonM2husfYSAgTst/IsCYG+TrUckPOdr03nVEeIkiwfF90YCxcTZhjSwb52KXY1cZtFJMut6ip5ec264Rfi/ZKQcx8xVH8pcXNQfE7WNnAps6XKpBBSC8uQJuWs5QWob9VfR73Mz7x1WQljqpVGHqSQ/qpwWNB9FQ6FAXfh70FINshW1fUn0jPqijPTasZZjpiHgTD8Yl7CUFl52a+dz4RVplLjm9y6y7DbwWz8J8rUEL4Kz2QPW2O0hVWuJXzjD+bZCG+xSPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=B1PU7ODNvMoNXgy9UfnGwzBY7kMcH0FxSVlaG+YAqW+BaDFnPSVVO2gKou90tydaZ7pUgh8T2AW74hE7U833V9ksKKi1imYGAUPETI9rdH7OQWx6pwLH6ZG6hshKXuYsNOmluvgiYiscm6dmmG6AsnxRGtgiC1yfB6OZfGvwEr5fr84vtahcwlbIqdPpSuGme1vS4QxdSRtBa3HFJy1IIQwfEMTGgzbTAKOkGS5ax9no0mFjl6Rz67hFS+u/2UBsh5HwecNWYhnl5r5ANSRM3BAUUCI/bQh5xQa+7F6kGUdVkrpVxiKyfNUKvSV1BH9fWGG+KFsKd0DVPJZ+dv1/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=N+rFkWhn9MthkKQ9xuDkEQsLgqogZOjoqlO8KH36TnbZZbI7QHptsnsBARxNvOg8SDRCpPykSwkKTjvEGxuWaBgZMpwTzN+P6AjQ1yfxpUBDNIFGKIEq1GBuYpJdKq29NC7SPycUKOogsxduxJySyinYcjM5i4uwdCknTAV/odk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB12091.eurprd04.prod.outlook.com (2603:10a6:150:312::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:49:14 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:49:14 +0000
Message-ID: <17fe63fe-80f9-4c3a-9034-aaf07a124c48@cherry.de>
Date: Tue, 13 Jan 2026 15:49:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 36/53] dev-manual/custom-distribution.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-36-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-36-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB12091:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bad4627-650e-4e06-ba51-08de52b2ebb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cm5EZ0VQVytKOHJGUFFKZ01PSFU5dWlsQkNmOGVFeVl3SGdzQlAyOTJaZC9l?=
 =?utf-8?B?MlJjOXNNMlhsQS9yZmgvWis2Qk90Tmx2VzcycmRYUVllRE9taWZHS0tUV29v?=
 =?utf-8?B?dFhCTnY0Vklrc1lzSE9pemZveUc3YjRScW0rZzFlbVFnVnBaNkhpdzAyN3Jj?=
 =?utf-8?B?eTFTWXE4dXplT2s1OEVhcitYS1lHZjlOK0gzdzI5azdrSWlyUkFxUjV2RVNX?=
 =?utf-8?B?cDRkQkRRMG5VZHFidkZtN3Rra3hVU1d3T0ROK1dOeWZzbzJkdVJGSGdhOHZs?=
 =?utf-8?B?WFZDLzMwOUUzNXRNa2dhMlY3Q0xsM3hhb0swOFJTZkxEQjVscWM1L0wrbzB1?=
 =?utf-8?B?U054Vlo4WnhhUFhwOXE5dVo2ZHByMTJDRjZOSkVmMWFVTWg5Uk9zMUxQQWsx?=
 =?utf-8?B?bE0vVWpOeWdaMmgvd1BsS1NGckU3RTdzaThWTWZ5ZHZUdWkyT0Vralorb09u?=
 =?utf-8?B?aVlNeGI1VkxWaW9uNENaSWl4Q085S3ExNjdnaDA2MlJxOGlYeWlPd3FnYlgx?=
 =?utf-8?B?MXdLdGdyLzYxbUVFbmw1YUR5YmdXc3R1dFBqTXNZaHZpM2FaUytnVVgxRzVy?=
 =?utf-8?B?TWdHbGg0SE5Jc1BCSVVvaE1xNWpGMjhoK1JBbWRBbzN5U2E1ZjlqNDQzREND?=
 =?utf-8?B?eHBFelZvajFYV1graExtREFtZVMvdW1KRTE5bVZocUU2OEJEalZuTUhYVWtY?=
 =?utf-8?B?T3pWczZTNzI2b1JUWjdKYkd6QU5qTWRkb09ZVDNuelFWdmRwUUl0VG9OT2xr?=
 =?utf-8?B?RDdNeWJqaVpFVHVJazIxVytHc0tzNkhwOGdFZ2oranhvUFpvOGpMRThmRjcw?=
 =?utf-8?B?TjlMQWxhQkZ4WG9xUjFseFBCb2xqLy9QTm0rZGpRMXVHVE5PZjY5K2ZFR0Za?=
 =?utf-8?B?Z3AraWR3L2Y3U3pJeUR1WWcxdEFoZURyUFRMcTF4RStPaFdEdFhEdURwbkZk?=
 =?utf-8?B?RWNiYVJzUGtUdVFtbEhsREhvZ1QrbEhuYy84a0pEbDE4elF5Nk9TTS9DN0RZ?=
 =?utf-8?B?eEEwNDkveFhWRnY1ZnRJdUNPaS9pb3NMNFpmL0VOODJOWEZOakk0Y3FTRUpJ?=
 =?utf-8?B?bEdPNTNuZlA2YVBNZ3dOckR2TUR5MEVUNDdzbVc5NVFoUmNSN3JFcDdBcXU5?=
 =?utf-8?B?THQ1OVk3VWs4Y3haVEwrNXRPYnlhbHFNU2dpTHVXV1kwRXRNb051V1JOc0Rj?=
 =?utf-8?B?MVprak42NmR1MG1JZjVuRHFWeEtEcldKUlFibHFiNXh2NHowM1h2MmRTeVdR?=
 =?utf-8?B?aGNCQVhrWDFlTlJUTnM0VVVXNEdwVHVpZi9CbU51b3QvWkkxZitLSGFwL3Z0?=
 =?utf-8?B?WGp0YVJlRzZuc20vVUk2Z25Qa1NmUytKTndaaXVRRy9hMkRIeHhCd3NwdFkx?=
 =?utf-8?B?UVRzbHNTZVB3L1RtYXp1SVdwa0FzMzg2WU96b2hhQUFOcVVoaVh0Z055VHJJ?=
 =?utf-8?B?enA5WjNZOXRqTWIrZmlrVnlUc1FOV3E2b2s2b25SK21jL09OVGs1WXBEVEVs?=
 =?utf-8?B?a29oSE42VlNkbHE3VWdZelBjaGtsVCtXaTNRUG5WNkx1WkFqbkJFWUVlb2Er?=
 =?utf-8?B?TDRIOWVMYjB4N3RQN3Z4aHkxdHdQTmNqNys0Q0RuYzdNZ3gwWXVpdFNNN05S?=
 =?utf-8?B?a2Y4anpBZkZPZHFuNnRCYS9nYTE0N1BiNWlESHRhcUhzWmpxMjExcHhNWm9l?=
 =?utf-8?B?Mm1OM1lXM09nN1VBY25ENzhkTjFackdyRmtlRCszUDlOdjVDRWtWczhXVU0r?=
 =?utf-8?B?WHpFQVFWTGxaZGRsWlYxY0Nuc0N3QmpGNkowSkdHRFZhRWhGZzFGZUhvdm84?=
 =?utf-8?B?V01nWGxIRy8wL2VPeGltOHg5UHdrcFRhZzd1TC9NeWZOUExUVWEyYzhnY1hX?=
 =?utf-8?B?bllwazhBcDJ3Z3Z0b2VxaU16amtzdGxEUU1XcFBRS2k4MU9OTVNLeGxMd3dF?=
 =?utf-8?Q?G6qbmrg5By84EpHlxGvygrRCJ92Ad8tj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QXd0RnhhSm1mdmlNeUJVVkE4VXZNQVYwZ09ibldaakZ2aUJPK0JjOWx3T1Bv?=
 =?utf-8?B?K2JlaVRBQVhwMnJ1b3NxZXFtbHBZeWFPajdBZ1IzNVg1Wmljb1hNbzlMMUpV?=
 =?utf-8?B?QXE0TmdobFlMOVlDeWR5ZzhGZWdEUEloTUtTd1lzUTNuTnpob3BiQThEWXhs?=
 =?utf-8?B?OG9xYXhvNWF5R1Zic1FhVm9WbjFBWWZhbUIvaWFwbFMvTENFWUhIVUx1SjBU?=
 =?utf-8?B?Mi90dUtYTHlvQ2UzdnJ1aFVRY1p4NWRnNnoyL1ZzZWhjaEdYNjd5ZDdPaHQr?=
 =?utf-8?B?bVRwQVhPSFZnZUdkUlBZMHJjblFDTUhvY05RQ0plak1qRHBPYmsyMG9rREZL?=
 =?utf-8?B?eksvczN0eTZvcHltZGEyYnBvTUlMczFqcWt1VXpJWWExeDlxbzN5VTFkUjdk?=
 =?utf-8?B?aXV6S1k1U0FHY0pUSTZmeHZETG16TktZeTRUVTg4VWUzVmdKbmRLQlJ3SmU0?=
 =?utf-8?B?M2ZXbEM2SEovNFVTRmM0OVpYVU9MTjlmSHBpU1VqQkxzc0RseTNhZ0prQ2dt?=
 =?utf-8?B?RFhaZXZPUkdpV2Q1OC9jTzJOUlhjK1ZMUmpuZnRYM3diUVpYSDJlamdaaGcz?=
 =?utf-8?B?Nm5oOXhmdUJ1dlplYmZ0M0Nua1E1cG5wTnA3OUJ3QVRjcXA4clNWS3cvbGhm?=
 =?utf-8?B?MzdTaStRT0Urc1RKSWkzLzBKZ1g5NEJjdmpwM1RsM2lzSXdhS3RmVmhscVpU?=
 =?utf-8?B?N2RiSXk1NTJVTHhIU1Q0ZEs2SlRWWFEvZ1JrUzBOcnFJbU9QVFpGazFIV3hp?=
 =?utf-8?B?N3NtYmxQMlJxWTkvNzQ5TzQrRXVJRmZUQU5OV1F5Ny9DbnZiajJUdVVUWnZs?=
 =?utf-8?B?TVUyZ1BGSDQ0Rm5nSG01bWtkQ2IwZ0ltd2FLMVlCMDlsUUtzRkEyOE1BRk5x?=
 =?utf-8?B?VzBLT0lhOWZkbVY1b3dnRGtFZEZkakNFRTY3dTdmUHNJR0lkc0tqbmgwRG54?=
 =?utf-8?B?VGY5bW9iemdwd2pGdm9UMUVrcThxZmorVU5pYmE2aG1NOU9RYWZrM283TDNU?=
 =?utf-8?B?bnRobGZmS3dWRk1uMDhEN1ExeGdVRlBVK21UQUJCSUdETjdQRUl5WnhZVFJT?=
 =?utf-8?B?aUx1Tm5XWGpod05IUCt5ZEIxeWNBVEpDcHVzT3gxazAyM1RMaHc0bmJtTjNU?=
 =?utf-8?B?bGtza0R0azN1OWVLWXB2TmNFZHJJU0RyQU1oUXVtT0JrZjMyRHFacDZTL2Vu?=
 =?utf-8?B?UzRodE5VSFJwWEViaW93RkErOXJvd0tzZmhIdGtYdHhFNmtNVkUzeVVHRTBV?=
 =?utf-8?B?S0xFUFkyZlFXQ3JHSVdWMDViaGEzR25qazQxYXlNbjZrNUViS1BseG80ZmxS?=
 =?utf-8?B?YXM5b3MzbFRwQTlCNVUyZStsYXI4Z01maUNkbmlsMlJQZGZWQ2J5RTZNVnJr?=
 =?utf-8?B?VDRUZ2Y5alRHMHlsN1M2dERpOG9BTDlBR0tNWlBaOUQ5OGpQT3hyc3NRMDNB?=
 =?utf-8?B?YTB3RSs4eDdZYmEyRWwyT1RuK2hIb1VtYzRKUVhVb2VyZitFZFVycXc1ZzBR?=
 =?utf-8?B?dlhMTmlYUmp1T2tlak1PZmFIL3k1OGlKZEJqL25QWFFaSmFEU3FQc2dyMDlu?=
 =?utf-8?B?VVliNTNLSjdZaWRKeERKUU4wR2tQa01pNUdSdzFtOTk0emlFT2Q3eU45RnBx?=
 =?utf-8?B?NDh6NkYvZXh1bHpCeDBIb0FmQmVwVUNIMzduOHNlM0ZYcDc5YlBEaXZTNmJJ?=
 =?utf-8?B?eEpDN2ZyaS9relFvUGJzU1VuWGJhZWd5TjBTVmN2b1g1SjlXa0Y5SUI2cnBC?=
 =?utf-8?B?ZmtWeFFFaktKRXpmWXdEeHVsQnhNYWYxMUMxVllub095RmJLYjFZSTdJMy9J?=
 =?utf-8?B?MVA2NkNFbk41YWNWdWtCRENpMmRSc0NtK3FYNmY0anRlQjNrNWxWUWpHY3l5?=
 =?utf-8?B?dWNSUjJnc3NTcjBsQW5GMTlFRi9HOGY0Y0MvQkIrK1J4Y2l2VmNCRmtYdUl4?=
 =?utf-8?B?Qjh0RFJHQitEem4zV0F4M1FlQzJOV094ZUc1WUgwUDNmS1o2N0dJTUo0OVFF?=
 =?utf-8?B?Mm9MQU5EYTIza1F4Sjl2d2l2OGdFLzNCRFh5SEtRT2dybiszUDBETEdOSzFs?=
 =?utf-8?B?VFNvamcxRHhWZ1NxemZmSVZsMUQvQlZjd01YNVBER0V3YndBaC9FcHp0aGhu?=
 =?utf-8?B?OUE5MWZHN2ZDZzIyWHpKOVhnNWxTMHJMeHgyL21YeUVkOTRzeDU0alZFWUJk?=
 =?utf-8?B?VkZ4dHR3N0ZROExRb0QyT3U1YTBzYVN2aVhCSXUrelhVd0hlWkdpZXlhMkVY?=
 =?utf-8?B?VmdlOUE2MEUxbFFHc29LdkF5NEJnR2QxY3YxOHBlejM1UXRVc3BDVHNwUTJn?=
 =?utf-8?B?bHJiQS9FRUZFT0ZHNGdDVlRsUEdyN2FEdEdjQjlzTTdxZEdFdkR5UT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bad4627-650e-4e06-ba51-08de52b2ebb6
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:49:14.6947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3feDd893R991kaeqS1LzV2SzT+iGxbR+7lZTiUrJuUkz2Lr0jnIw5ILtr0AiDAlq+RE7ZLAqR5gteqHW7vACkYLQN9gZpxnPGic/eDaJ0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12091
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:49:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8525

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

