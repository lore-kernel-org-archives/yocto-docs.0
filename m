Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA90CD2D0FF
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:26:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58965.1768310810405943698
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:26:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FtmNSNnv;
 spf=pass (domain: cherry.de, ip: 52.101.66.36, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELgQH5Q9TSc6w4uFS/j1GYdtE5Vrc+eHBXk62clTwOgX+YDGbdx1ZBLstfADC0NJjDcXQSeDxPx/WyRqedmbAwoysJCWF4nCwxdVXmvjHwSgZqYr/JnpO+kiXQu02eAGE8a/N1DdCWmrfra8TypKQR44uecJMupfZf2yN/Hb6UlaLDVEBdkxZwoMbRNS8kUF7ZP1mn2/SXnkRUf8KHt5xd7ouEzZVRv91safIjHb9p5p8x9LCEiHhYaxES0HoKEnfcVU4FtKg5DvSrZfRefLjQMtQD1T4bKblvArFl2COaKuUajF9ROYoOdnCUS2wQ0F2rgu+4/F5j+/MkZlbeOmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeWSfZFb0OQaWsytR1zAcOpAQIw/FbcAvVYpsUTwl3I=;
 b=oFORRTwEUfJeAPuuV2H0M/xH9g3+k86Ty5WUAPzqE5tfREBFOQuMINhf39+o3QUAefR5NYUIToDjEjgJzDe0Ch+JJeWpR2N5gHLeBDIIDm3+NWScoOrAj4ma1wFKQLGFPqP09tCODqwodFKHgPyc0452oA0MbGOWdb+zeAUdfAhDL4GRWOVRDS+0mTSSO1JajCDv+/ptaQZ93AIdMXQCQ9svDRVC1bFQwKMPHXIVwuXTfUlQrjxFj+iDeCM5fua4nEoua/HsaT1NqN3+xen2MzBZhWaJRLqKDUkznV3UPlvIMtadJCvwNgsv5l+tBybLx1U28ReWorofT0V4ecBvSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeWSfZFb0OQaWsytR1zAcOpAQIw/FbcAvVYpsUTwl3I=;
 b=FtmNSNnvLlcDKKV0dDpxuet5bvFdNtjF7bDO0Ih2EE4WbLE5lTlQwvAjC9i3eLkqkakOLMlHJFmlouY/jEfn0gEXrja6V/0UDf8CmWhvhOak+0zmiASBrevK1M4aaoWvyBjed3B3fu3rgMFaV3QNy04D53nGxxplQZsojERYStc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:26:46 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:26:46 +0000
Message-ID: <1aa5fa43-1e7e-4daa-bd68-4d9278a68246@cherry.de>
Date: Tue, 13 Jan 2026 14:26:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 20/53] migration-guides/migration-1.4.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-20-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-20-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0332.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI1PR04MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a52e76-4a0b-4135-9866-08de52a7662c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cktyVzJUU1RDdXQzbE5ac3BWSFFudS92WXhlS0ZZRzZhQzVxenJlOTRXL2ta?=
 =?utf-8?B?NUM1MFFTT1JML0E5YklCVXBMQ3JjTFU3S0FoRXp6M0ZvR0tBYzdTTlNtK3ha?=
 =?utf-8?B?ZVZHc21wb3pjWU9tQ2tPbXhRSEpxOG91aXVybTlZVDBYcEZvQlkweE1IL3cr?=
 =?utf-8?B?WFF1WTAvWjJ0R3Fmb09vTFV6TTN3Sks3ejVOb3B5UUxDcFR0SVpVU1plWkdp?=
 =?utf-8?B?SmNTUTkyU09zeXNDQWh2bzNsVFg0RWx4SHlEVDVWUDJ1VTJDZUliQTl6R3RX?=
 =?utf-8?B?b0hLalJwQVlnOWdsRE1oWVdWQkVxUm9yMWI3YURXUjZVZE5YVVVCeUdnM2FY?=
 =?utf-8?B?b2ZqTVJ1Q2t2cUhiNTd2NFRuUkVhejB3dHVtL2ZzcEFPSlFrUWc2QWdvNWxq?=
 =?utf-8?B?Ymw5Q0xTd25wUUxJeTlDeTlmS2NhdDBpdXdzMEdnNDlxUk5jeStsK3RndWU3?=
 =?utf-8?B?VTRWRjVaMVB1YkVwQ25LaDZyNzhXQ2FVSFJ4TDZVcWZpek53Ymw4S1NuTUZS?=
 =?utf-8?B?bnV5RDZ2YVZxQmtKcDFQWGd5enV6dGFsa2xrVjF6K3RscXMxVW13bWgyaEhN?=
 =?utf-8?B?NkhldjJtbUd6amRQeU5DSXJLSjlyQkw0TnF1ZzRWS1A3cnlMTE45OHRxTk5Y?=
 =?utf-8?B?TkgxV2c1UVFTY2ZpQnZvU25peEtZWTBuRU80UExXYWlRd3VXbjFWOFE1Ynll?=
 =?utf-8?B?WkJ2M0w4UVN4dVBkd05DVEdDcEN1SGN5TXU0QVF2TFlGdHJEbjdpaWs1dzNU?=
 =?utf-8?B?MTIvTVBqTVc4TS91MEx5ZUROYnloVWIvanBmbm1FR0dRTUVnZ0dZcmNVMEVt?=
 =?utf-8?B?TE9tM0ROd0c1c3gzb01pdWJ2S3RxT0ZZL3VlUG1sdnNhZElXT3k4MytuRTNW?=
 =?utf-8?B?cTFXb280STg0YlBJY2dSRUIyRHZTUUlxSHdwMExiZ3lGeXFJSmhmQTdRMlQ2?=
 =?utf-8?B?VDlhblRnc0h3UVkrMkU2ODBqL2E0WWx5RzFvMVc0eXhEUmJ0MjhHZmtMVWsx?=
 =?utf-8?B?Y1ZxclBtd3JKbHE0aDlHWlRaRUVySXVibEtuMXl5U24vL1E1WjFrY1FZOWtO?=
 =?utf-8?B?dzFGTUxFT0ZLTnJGK1AwV1cyS0s0QVBzVmVQUWpVbWVSL0RQRUtUTFU2NGJV?=
 =?utf-8?B?WTZ2L2hCQ29WQUhkek5VVURjRnJIMXZ5RWRuc3dpYit1dzNxUTdYeGxEZGlt?=
 =?utf-8?B?RDBwaFJEWkZYakltSWRlL3FKTmhUMkcwNXppK050ZWgvRDIwWlBCQUhxbVZa?=
 =?utf-8?B?RWdWVUFYdm1GWU1CQ005U0FCNGFpM2I1UVY0bkx4eTYreWpnWHNHdTRwbFhr?=
 =?utf-8?B?Y3RpZGU4b3dYajlkQkJFdFdYSjdzSEJhTHBRclVHRkFoNnBDVWVlL040MUtw?=
 =?utf-8?B?Qk1HUnJSdXppSjNnWHNuUDQ1U1FQV3lkZGt5TmgwTG5sVlB1Vkh6QnBLSENE?=
 =?utf-8?B?c1FxUFVpQ3NuMGFqRUVzb3YwU3RZdmVMaGo5MzNkVkJMTUIveHpyWllybmZx?=
 =?utf-8?B?TXVvOFdORjZVY1Z2cE5GREdEczQ4Wi9ZRm1nS244TmFvSmovK3p3WW83NHRs?=
 =?utf-8?B?WjNjbkpXS25MNGovTytNdjJFMjhFQUhqd1RieWZzcDZ6OWx2WHlLOEFVV1hz?=
 =?utf-8?B?VXNERHRJTTR4a0orUWpuOVJZNERwYW9Kc3RNSWRZMTU3OHh2NTM5V1g4dzAv?=
 =?utf-8?B?L3BHeExGQkF1WSszOFpJcHB4WTRrc3BETVN2eHNLQmVFcG9ScjgvTER6NFha?=
 =?utf-8?B?M0d2eDdBcW1Ibk9pejIrZ3JIZzljRmw3T3l5Um5CL2owOWc5QzF1NEtkekFQ?=
 =?utf-8?B?WGlGNHdUYTk0Wi9OTzJSMFpRWHdLSVlUa21PSzhRWDlRMjBKcU9XbkdZYjZ5?=
 =?utf-8?B?MDl1dGhPRWVFdlovQmxDb0k5REJqaUtIRmRyZE90OVcwc2c5QlRKUEt5L1p5?=
 =?utf-8?Q?aeii7HNiDApWx/vo9e6/MIPUl8qkW8S9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TDlHYjB4TkhGUFFTREk1b2hjbG4wVm1wRzUxNThhZjJENVAxL05DUGh3K0Vk?=
 =?utf-8?B?dVhiK0xlS2hWNktzcXRIZW1HWG9xbXVDUmNXQXQzYkhhQVNWbGdjZkhaNmxw?=
 =?utf-8?B?QnNIWHcvRm5RbGgxNjM1QTZEd1ZxdUpFTlAwVld1K2ZQUlVid1ZjVEM0R08v?=
 =?utf-8?B?WXFCY0lOU2k1OHJxQWNZbDczTVRhdy83YVRkRTVzRXlMSjB2ZUZIcDkyVDV0?=
 =?utf-8?B?cS9kUEwzZzRiWUZUelN5NHRyYVNpbzNxSjluTDF4TUhRRkdpSnRmbHR2QkJJ?=
 =?utf-8?B?ekhCN1ZZLzlIUkovRWcvdnNJdUJtZzF1eVFENmtyQmJyRGNFTzhyZy9ZVSs4?=
 =?utf-8?B?NkYrOWw0VjFRVXFrZ2wyaVRlR0gvdHZ6bTJxbUZ1aGF0NHBaRXREbzRpd1I1?=
 =?utf-8?B?bkRMblZDUGp4NmtuSzc5QnVIbGxqTXpmVXhMbjVnb0oxZWxyN2IySVRlN3dP?=
 =?utf-8?B?Ujc3VWtQa00rSUxqTHNhL3RNNSsyOHE0ZWVHcEpMQlV5VGVwNHNlTHVEeWFB?=
 =?utf-8?B?SUVkNjNlQ2wwNTBrVUhmSDRuZnVUUXFRMis0SjhpQ1haRkJYNHh2aytNQUdm?=
 =?utf-8?B?WG51K05hYThnREgvSUE3cUw4eXV2aHNnTFB4TGhGcWlyNHZxcmNQTkdFbVU1?=
 =?utf-8?B?TVVCM3N3UUhiZnBCRVFOVzFnWVV5QVd0QW9KU3czQzJZclc1SWZTbXhLRmxv?=
 =?utf-8?B?OUp1R20yK0FiL0Y5TllSQnVsaGFNcC9Ia1BZalk3Q20zbk1hbzdFREJ6WTd3?=
 =?utf-8?B?eTBRS3dMN29DaEhXck52L3JHNVlvRE1JVGRBSGp1bWxWbmdoQXkzNFNkV2Rq?=
 =?utf-8?B?OW9EZkFkUEJTcXZMdnUxU3JMNGR5U2FJRTZ4Vnk0MCtNL0ZiUW0wTzZ4QjBa?=
 =?utf-8?B?M1RBQ1g5QU1aOUQ0Q29ZdkxIS3FYK2c2M2V3cmhkOS9zbmpKRDFiWmg3S3dy?=
 =?utf-8?B?SzJ6dDZxc0svd2dOT0wrcXBSMjRQNnFhMzRvWmZ6WjBwWDZnYTdaU005VW1E?=
 =?utf-8?B?ZC9hZHE4c0lsZmgvRTlyR01YcERuYWpqaGIwWkVEOTc4Ym9KUGVIaVA4WE0r?=
 =?utf-8?B?MnFGYXJ5VVJjM1JVMnUvUW53OHFJUXY4VTJqZW1CVXdjdjhiejRDc3NYM0xQ?=
 =?utf-8?B?dkduVW16QnVEVDFsUk9NM2pUZE1DYURzWmVBM2cvRWhvODR5V1RqVVFvanVp?=
 =?utf-8?B?MTJJd1R4WHdwdVNldU1oNkNuSlU2T2FUNUZ0blF1WktnRlE3OGtMTHZMekUr?=
 =?utf-8?B?S3FJUTdVdHFyRXh5T3Fhb1FjT0ZQekkyYWdheWs4cVNRWUcwMkg0amRBNldw?=
 =?utf-8?B?MVVPSnBVWnJwSnZJOXZXQlhORzRBUmxuRk1LV0tNRUNETkN2WUozUXdxUUsv?=
 =?utf-8?B?MldJSHVHNFRBdGU2RW50b2N6NmxUSDQ2Tm9zQlplV0NrYmpZZDRYZncxcHRH?=
 =?utf-8?B?VmZUelJvN2pvb2hNS3BuLzA2Y2JhZGZUT1ZaRDBqS0gwU0VQMDRPYjBNYUZ4?=
 =?utf-8?B?ZzNxYXRQaTF3WWp5YUdZWEJJci9Ya3NQdGE3SVowVWRIWUgyMnJWM080d3I3?=
 =?utf-8?B?RitPWTZ0cXZTYW5ybWdJeXZoWVJ5T2c1MGZGQjZ5ejJsSzVsNTlKb2VXdmI2?=
 =?utf-8?B?R0o3d29sa1NCMmY1Vm1XYXJyS0FnQVVtSU1PYjBIZ3R6TG1kdng3ZjZjWjJu?=
 =?utf-8?B?bVV0cW8ybDR1MlhlNW82U0JBRlIzWHdQNG83eXAzTGlPQjRyT011WVRJSGdF?=
 =?utf-8?B?NGdIcEUrYzRyemVPSXNqZ0pDbEV5UVF2bVdUMjg5dmhUTkRQc2grSHU2T2xW?=
 =?utf-8?B?NENHZWYvY1F6U0llS21Ic1A2V2JSajRJWURMaFRPaFdqWTZuRnRYaWVkRjhL?=
 =?utf-8?B?VEV6V21ZNGtuek12RnZTS2xrN1diZS9CV0hHbWV6M0RKWDdWU0p3UFB3VEFz?=
 =?utf-8?B?elBuTWZOQ3NlejQ3aHdFaTRITkpOZmI4TTVZK1ZrdHYrSE9DdTBjZlVHTWFE?=
 =?utf-8?B?cmxESzVsWFhxNmFkQ1BHTGV0emxRa2hOSUdEUXlkL2ZuVk9uWnF6K2JiOE5w?=
 =?utf-8?B?WjJscWFTNjNWOExtbnJKYzNnNzdmb3l3WktrMFZoR3FtZE1mOUNmaXhzVmMv?=
 =?utf-8?B?OWNzMHBFSi8yS1d0aU9wRDRtMU9hR3ZoRkpXYitrbU9DdFFJSUNEdHc4OG9P?=
 =?utf-8?B?ZnN1Wko5dHVPUWp0QmJuMDM1NnROWnA4RUtQampIS3FqQ0pZc3NkUUlWWXN3?=
 =?utf-8?B?NWlWMGRlVEZXZVAva3FnQUN0dlRSLzVzdWVqQXdHTVVpRHdzampvOFFsYjhT?=
 =?utf-8?B?NFhhbTNwbjEwTkNjbWhucDB5ZzdZZUJadXMxS3RuWGMvbFJhMlFxZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a52e76-4a0b-4135-9866-08de52a7662c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:26:46.1323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DW+JvcfhdEZU6yWHQhlAgjRtGXHuMc113G67VDvp17ZgPEwTWvemAJLUKYP2nsnRTPNE8LPZw2wdKjjuatBnNg4yRLkFUu8hbUQx0vlypRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:26:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8509

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/migration-guides/migration-1.4.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/migration-guides/migration-1.4.rst b/documentation/migration-guides/migration-1.4.rst
> index 6db2a035b8..5d8d0ffde8 100644
> --- a/documentation/migration-guides/migration-1.4.rst
> +++ b/documentation/migration-guides/migration-1.4.rst
> @@ -82,7 +82,7 @@ Custom Interfaces File (netbase change)
>   If you have created your own custom ``etc/network/interfaces`` file by
>   creating an append file for the ``netbase`` recipe, you now need to
>   create an append file for the ``init-ifupdown`` recipe instead, which
> -you can find in the :term:`Source Directory` at
> +you can find in :term:`OpenEmbedded-Core (OE-Core)` at
>   ``meta/recipes-core/init-ifupdown``. For information on how to use

suggestion: Make "``init-ifupdown`` recipe" a link to the recipe?

Regardless,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

