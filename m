Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53DBC0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 11:02:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.13])
 by mx.groups.io with SMTP id smtpd.web10.9636.1739271739205434148
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 03:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=awmOURd2;
 spf=pass (domain: cherry.de, ip: 52.101.67.13, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wc2Rtj/mOHuhFyWsEeHgT5jYdjBAXAhuTfk8kYuLZbLcb619Rn+scJjAzd/5pORunQ7gPgZoQxAU6B6tx370NSlGfaLPNfYOKJgAS69yofm4PoFfZ4Rx2jYy1j0u/l/UuHZT6CmMC6NE1vzfqaarRxcJPybM0xbwZaHs7fEls+H9fIw7vrAP4FgMlDKE6MOGiG/cikkqKqmXXMyxLNTSOh24WIkYqpRK7gUeOy+nXGWhGcSsroKC3ln5PJRMV1Dvdo89q6GDD1A/A4AgepmUGI1LO7frwxt3b3+Gu9NgepwKxCUuLLIXR0KWd1TRD/2GSC0PtOcUbK52awappDjQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDGo25VSBBkRMMwoXUmVxhp2c1rRxihxS6MTWA2a7j4=;
 b=eaM9dkoLtYcS9N1gQrb+i7pCTfq7lMOYiAiVY+c11v2W01WeDL6/ChSpwRxmZfvg0a3xda62sKkdLW23LLUxtXMN49xC1Qf38nx+x+KAJot8OJnEw8fu4STxVvQBi5h+uYkCus4R0zYkDrWRIbwdM673quZnbNPpP8QXTa/6ZCupF7mISOEOjrp+fpJqJ5vzVmHNDhaMDnkkM4qxqn5xwR4rJAxaCiAVMs/rCLQMAZR9Q2yaASnuQCsn2soIhd1ZkgnFJtgFsalL9n3a9b1EJTtvZaZKubrrtP320XG6KECdvv/8L1QeP7m7OSZ4AxhPk0DNDDU6NYyXiy0Sxv2Ncg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDGo25VSBBkRMMwoXUmVxhp2c1rRxihxS6MTWA2a7j4=;
 b=awmOURd2ZV+MA4Uv6MCKcDfF11bHCHBb2jbKX161PcbksURb70c96uma8zqqzB/ZfG7Vp1mC61GTItryPd64sq43MfXzbDosTLpRO3fo9cncVdIWQLVtcaxhrFE1924GXqPhX2B1fv6zi8VeqUc1ryA9uR25Kldpa1T1iEQWl54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8693.eurprd04.prod.outlook.com (2603:10a6:10:2dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 11:02:15 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 11:02:15 +0000
Message-ID: <b9f4a37b-ffd3-40dc-aca8-765cc4077b0c@cherry.de>
Date: Tue, 11 Feb 2025 12:02:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/6] dev-manual: move multiconfig documentation to
 its own document
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
 <20250207-multiconfig-doc-v1-1-f63cdab1fad9@bootlin.com>
 <ea0cf4b5-f7be-4fd7-8e22-7186364b7089@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <ea0cf4b5-f7be-4fd7-8e22-7186364b7089@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0270.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::43) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: e54b6b71-ef8d-4460-db79-08dd4a8b8b25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MGs0WEZUR1VMSTJHcE1XSDZoODRUSXo3SnU5eW5pWkhzT0VlREo2WW9WNFJh?=
 =?utf-8?B?dmxNRkwyUmcwd1JHcG81SVZNT0o3Y3JXTU1VZk5FSHYzcisyTzNyUDJQRC9h?=
 =?utf-8?B?TkloUkxVbGdsVEgwN3RXTzBWU1M2TU9qOHlqWWMxV2FUeFBLdVdmZTk0RGR4?=
 =?utf-8?B?akhvT0czUVBQTjk3bTJLM3VlYjV2SS81azIwWWxrYmRtNDY5b1hPeHc0NVMx?=
 =?utf-8?B?YnNRc0FXWndLT2V1cmdzMFJFM1Q1aEszM0YxRW16Znh0LzN2ejBvcU9VaTVs?=
 =?utf-8?B?aWVCNUxJYXB5QXVXUENBeDIrRDQvdVNVNmJSSE94ZkNZcUw5R25lOTJKMUI4?=
 =?utf-8?B?RkNjajdyVS9jWEdtY0xaSFpsSzR3Y1h2RWFCbnNEVnVkQkdCV0FBd2t0UWJE?=
 =?utf-8?B?cHQ5YmVDdjJ0TFhGWng3dFdrZGFXQ0lWa1FwNk50cVozTTFCNUZrWWxSZXhT?=
 =?utf-8?B?ZENxVis5ZERDdXFLVXZxU3RmVWhFSnVldUplaHhTbFFWV0JxWk94SGJ0MSsv?=
 =?utf-8?B?dE1peit5VGRuUmpYY042ait4WEcvMWErRE5GWnIxN3ROSmR0Qm1VcVNwRTZa?=
 =?utf-8?B?c0dXM0FldmZpTzRzYjlyWW1hS3lTQ1plVktJajRiY2lSamZxcGtsRWhnbWQ2?=
 =?utf-8?B?KzMwYzJ2eEc5QjBPQUxhQ2JyRVpvT0NwSk8zM1pXY2tXaEFRVnJUZ0R6ajBF?=
 =?utf-8?B?dDdRZ3RYcHFuOWRSMXhCUWtnVTVKMDliVlc4K3FiN2FGcExCZEs4QmplMkNw?=
 =?utf-8?B?NGkyNGwyb1Vwc2xEbjh5bFdCOG9WVGxnQ1lBRmZPTGgzUDhpNlplVXpvdWF5?=
 =?utf-8?B?Z3pjTkErU29tNWVyaGkwdmk5dkVHVUViZmprZnh6SEdRd1FyeXcycGxHNlJ6?=
 =?utf-8?B?OFRqOFRFQnZDRG02ci90bTgrY292dVR1S0lJSnIvdE9OcnhrRkQwSWNQeklt?=
 =?utf-8?B?dVRVR2NJVHQrcFJNRXlQMitheU9QOXoyZm9xTjFMcHUreFZYWGQ2ZFp4OXB6?=
 =?utf-8?B?ZkxnMzhGVmJpZVFVUU1IWnJRdzZiSEVyencrTG9BRFFqUThzY1VSZ3NzSCto?=
 =?utf-8?B?Rk11aHZ1bHhLK01WeU8yckxRNHJVLy8za0xHa0RYUmZXeUNEcExHU1RadXh2?=
 =?utf-8?B?ZzdZTVVhYlNtM0ZpTmV4WUx1TVI0UlM1NzRNSmJQMzZzRHVjYTZhY0M2b1kx?=
 =?utf-8?B?Q2l5am5NN2twVldCc3phUGdvUVh5THozanBuVHBvS1NWckF2c3ZaSmpaMXll?=
 =?utf-8?B?Q0Q5YVY0WjV3Y084eEw5dnk1TDN6ekJzdWQ5K0IzdzFCV0FLbU9WWnBVWi9r?=
 =?utf-8?B?KzhuVU1GeUFLRGs2VFdOcnlUSGVHN0pYRXJHekd1c25LU3ZDbENqYVBsMVpQ?=
 =?utf-8?B?c05rdmYyT1FPYXNhbWlLU2FWWDVZK2JKblVrZmlweE9NdGFQbEtmRTFwTmRT?=
 =?utf-8?B?KzkzY1lLT3lYQmhSeTRNTldnT1lvVWMxUHAxWkNXODFmT1dIR1VLZWVvREFO?=
 =?utf-8?B?TXVxSWdUdW9FOTRqK1BTcDR1ZGVGZVYzYW0zdkQ4d0pNanlQQ0VISG9qVk1T?=
 =?utf-8?B?UFRleUxpa1ZsSmFmNlY0U1FGYU1JZFE1RXY1dS9yZTVteFhDQUszSkErUGlD?=
 =?utf-8?B?dUlFMXV1QW44ZThkTW8rUTIyeTRzLzIxNU1vU0ZFMGZnN3RGOGxlMFVVUWE0?=
 =?utf-8?B?eTEreUJyeStJUDkyRGdESSsyU1V2RitaMTV5cUhGa2UwWTlielBUZEU2Tndt?=
 =?utf-8?B?QjVXWjdRanNoR241VHhCUUplNDE4R3pvZ0JIdEExVTNhQ01qc1dZekl6cnEr?=
 =?utf-8?B?UGRIalN1dGYyVDU4bFR1Q1JQNFpOaUNWaG9QdVk5T2VHK3BRMldQRVVhSzVj?=
 =?utf-8?Q?YuN4NA7fJCH3+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVdxR0xuUjAwem16UzFxcThJWktFVUFGUWg0VWd5dk04UFlaOWxKbkZ1SmJE?=
 =?utf-8?B?bkZzMkJvRFhFY2NlbGF4L1I0aTZtSFU4ME9jRHBtaGh1Sm9MMldQVTZZWjVK?=
 =?utf-8?B?RkRyS0ZFamRDaXZ0TVIwQXA4OTU4T01KQjlHSm1QcmRGMFMrODNPelloMDF4?=
 =?utf-8?B?NG1DWmZoN2tVc3l2clFBQ2dNZ1JLd3dXUUtZSW1NbmN2SUROTVd5MEdFQzZG?=
 =?utf-8?B?SHhGUXVjWHl2d24zNkl4RVdZamVBQ0Z6SVh6WnJSOUxJck9FbXVCMnZzd1ph?=
 =?utf-8?B?a1ZJVzFJZHdBMDZKSGJ1SXBzYTE2UlhiUlEwdm5tS252SlQ2MU5vMDRjYTZv?=
 =?utf-8?B?UStpRWNmR3d3azROQ2QyYXpLUm5ERUNkQmFPYU1pTEJoU01hVzFLT29pZktz?=
 =?utf-8?B?am83OVFUQzJWY3ZlTFpHYnkxZ2Q3N3JQNFIzSVR1WUJMZzI5VGUycG1xOVVQ?=
 =?utf-8?B?RVhlWHNHL3Vxa1FTdzQyK3YwQjRtemloNEJveVlDYnRwTzJ4bDdTUVZoeGhI?=
 =?utf-8?B?Vnh6Q1Vzd3hTaGlhNmptYXFNa2xKUit0M0kxdDhUYzY0anhJL1FRTzQ2U0J3?=
 =?utf-8?B?OTd2a0x5LzVWTitzV1NhUlV0YnI5OGR1N0FMYTN6RmZXMS9uM21UeEFidWF6?=
 =?utf-8?B?QjlxSHVEcGlhR2RwZS8xbGVaVmp6amVmWWdWZVQ5aFdqQlNSRDBUY2NwMEVo?=
 =?utf-8?B?MjhHQ0tIQ3NkRDQxVExUQmVjY3pUdUk0dXl5M2preWVXN0ZYRit3dFRwa3hm?=
 =?utf-8?B?UDE5enplVVorQStlaW1TR2dBUm5Ic0twRmdIMXB1RUJ4d0kzYXdHYldFUk5w?=
 =?utf-8?B?MDRUTjBJZWozbzhscVZWYi9hWGZJcFAyYUNrZ3d0ZE84YVNPUE4rdThJVkV2?=
 =?utf-8?B?YWt3bjF5VGRrM25DUDMvTks3U2VsUVFINmJNN2JLNU5LdU9vNVJlUlo0V3Zy?=
 =?utf-8?B?SXRnaVlydHpVYytGSFpiODFWeHNlZkdId0hMMXJkOEVGaGlWUCtOOUd2UWsv?=
 =?utf-8?B?ejZPbmpJS21aVVpvd3lDNmhyaitGRklpV1FOL3JVYlc2TVRyM001TTUyajZB?=
 =?utf-8?B?VEJXSzFJQXNJY1YyZy9MOVJOSGVjMkdScjlOYjVTeGpvQ29zOElRWWNYcDlU?=
 =?utf-8?B?aitBYmR3cWZxdmJJQitBcEtaQ3dib0VPNjFQTnlWbXBQY3pIQlF3VHF2UUwy?=
 =?utf-8?B?VnFDM1VxMENUL21oZHpvK0RTbHdmTmprZm5pRWttSGxlZVVBZnhJMjlXRFZr?=
 =?utf-8?B?eXFPMm5HQkhWdER0eElNRFZUam5aN0I5ZUdZWFRUVHQ1VTJRYThJNWtKZ3Vz?=
 =?utf-8?B?NHFqQnc3T3V6T2w5bkNVUjNxaFp6dHJVcDI2c0tSUnd5Z2s3dkoyendxVUZo?=
 =?utf-8?B?N0FWbkFBL1NDZEQxNzhUa0xBeWNOdVI5MmRmRW5EVVB1T3V4dFRNNnQrdnRJ?=
 =?utf-8?B?MDBGTytqL1VPRllkR0dhYWtidDUySmZPSmJ5Und6eGQxV3BGNStGNVhQQnR2?=
 =?utf-8?B?cDdUSGlOa0JRbEJsbXRKeGUrQmFNUTBUN0NtU1pHdlo0RTgrRWdWZVAzb1lv?=
 =?utf-8?B?WFVDZkF1eHJmMHJSakg3aVBFQndjOXpQSTlIc050aVlMNG94bHV0ZlVVTnF3?=
 =?utf-8?B?c2s1NVJ6Q2dKUzlJaUZrYytnQTJSSnVJeTJlK2ZLcDRNMStXTjhlTllUNjEz?=
 =?utf-8?B?MEhRTjVhRzMwYis0TVdzMXVGQ3drT3ZudlZEb05qTTBpM2VpdVBCRHl0bjdI?=
 =?utf-8?B?Rm5LNU5DcGZTbENXM3FYWTRJQzJnTGx0RXd3VmJYME9uYlNJT1ovWXNqa0l1?=
 =?utf-8?B?cThqNEZFdlpRbE9ZQWNlUWlkdVVQSkpGUWV4bzZKRERHTm4xL1RidzRPcmZn?=
 =?utf-8?B?TWRDbWNnR2ZkYVd6THhHVmFqK0dXSGYrWnhPN0daMzQ4OUtkTGREYi9ZZnZR?=
 =?utf-8?B?eVhsRkpBZkVDNlR1OVlUTnVKN0hGZVMycUx2MmwxekxadEszcy9UTXlTVzA2?=
 =?utf-8?B?MWtrcTRDZnc3cVBmVDJDcVhUL1dSRHc5WjdBOC9halVyM05pT0UvenVxUy9T?=
 =?utf-8?B?d3hHK0ludEJsZzYyb0k0dHdzWVVEa3hQUktpcTRyK0ZVdjZwSndKNVAxaytK?=
 =?utf-8?B?TEk2K2pPK1NFTEN0UGhlcXpYVXdTdmZ6and2YXR1a0o5VGJ2MUQ1UkV5VStZ?=
 =?utf-8?Q?Y0SPjJ05I+Fd72KdsFZ3+34=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e54b6b71-ef8d-4460-db79-08dd4a8b8b25
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 11:02:15.3111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOtg7hTuViNpk0/fnFWj1P7A95QIlhB26nLEnBwZz/2h61U3D/x09HY5XToy0Kpoy/ZoeQhgRjNB4bTujCiSIvgEU2hnjfRFb2c4bzvj+6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8693
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 11:02:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6330

Hi Antonin,

On 2/11/25 11:41 AM, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Antonin,
> 
> On 2/7/25 5:28 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> In preparation of more section and examples to multiconfig, move the
>> section about it in building.rst into its own document.
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 

Rescinded actually.

This doesn't build.

yocto-docs/documentation/dev-manual/building.rst:116: WARNING: undefined 
label: 'dev-manual/multiconfig' [ref.ref]

You did fix it in patch 4 during the rename but it should be fixed here 
as well, so please do :)

You can use either:

:doc:`multiconfig`

or

:ref:`dev-manual/multiconfig:Building Images for Multiple Targets Using 
Multiple Configurations`

The benefit of the former is that you don't need to modify when you 
change the title in patch 4.

Cheers,
Quentin

