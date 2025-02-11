Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3948C0219D
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 11:03:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.web11.9794.1739271783086539180
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 03:03:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DfIbIpUS;
 spf=pass (domain: cherry.de, ip: 52.101.66.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJEavpQ9iu/BzhTdA7X2RUSqXUWLcpQrPMZIzjSzNtcT8F+rL4FNqCXD7RYD+uTgS4uYl6Py85+giw94Vp7Vj9TsV74++XkVrMNdGy/kXpaLzH+tIK+agvC9LPHAGLXYhBM+csUIuWhO0Bicr1pUvAkD1Z102xryQSDvxpS8fuFt9uhSDm5VoKN+tGSVzHJ21QWx2iyFWHoy6dRmmtK3lKgCcVom/AGM0A+pRJNlnSEB7I8Iyut/pSeeJ+TwAEED5QOAYwRXe0XX1pM8ze6Td+kCL1UUfiG39vp5bqnD31ahgn5Rd7IIJoGTgBoNsgnzmshOCzLSVseXs47Gg0Y3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaYTiqwjC6uHqqbA0EXpHFulIqEOcZm/ZNDO3ESFk+U=;
 b=aHXJFGxAddvRQwLGYo9rf4Ilhoey6iMzJt6yQnWDvsHy4WD3xlOi0gSxLDmgsOdnd7yocnEHjNIa0YO3Hdk74XggBGoY0x7RpuCQjUoidkjDuw7rtgmbTF6JYfLWitS8iYRdpp56X4ey3+Q8manp9GTAlCpuHp5Akv8jRYImxAnY4/6Ia7Nsp9VdjYQu7fB2ymIutWH1wYeFOGdQEFVTGBW3nF52w2SdtCXr3OItlN2kMlS6joO8/gdC8e5D1Z4F+/274OwpMDCb6S8WC5mtb3CqB+cY0TJQyJroute3oosctH0zMBmINFP0y/Ry8Wln0FmzE0TdMN79E4WCMtiryg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaYTiqwjC6uHqqbA0EXpHFulIqEOcZm/ZNDO3ESFk+U=;
 b=DfIbIpUSz7Af+JWVYyKuA6rULDtQfR+td03bcP267gGD0Tctk/S0BbjvrH0UJBozPT6lCAC9JiKPPunTzzs8Y4JKrxya5ZCmML0BUG1igKKdQguS+mE9AVZHQtj7cBZRgWFOKZX8iZHZJtd90+tx5qXfDTiPHvBQZcs3ExPxtIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8693.eurprd04.prod.outlook.com (2603:10a6:10:2dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 11:03:00 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 11:03:00 +0000
Message-ID: <76021de4-0b41-4b91-a73e-3690a90bdc7e@cherry.de>
Date: Tue, 11 Feb 2025 12:02:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 4/6] dev-manual/multiconfig: rename to use
 Multiconfig term
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
 <20250207-multiconfig-doc-v1-4-f63cdab1fad9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250207-multiconfig-doc-v1-4-f63cdab1fad9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0245.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: 96551378-4f1e-4c5b-cd5c-08dd4a8ba5fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z0NjSXZBcVZDK3p2MjgxUGZQKzMzMzM1V2pqeU1nUklIM1BjQ3lzdkUxelVs?=
 =?utf-8?B?ZHk0bEFLWlBNQW1PbytaaExuRjlkS3ZzZDkvWE1MRTMxUHhPMXpDVVdpZzB1?=
 =?utf-8?B?WmZzQktMM1hyYWdUNDU1TFExY2RROS9sUWpTNkszbUEzQ1FvTEZSazVYbDhG?=
 =?utf-8?B?UXVKeEk5a1h4RFRvcmwvTW9vTVBlK3Q2TmZRbUFQWmVzNExOUnVROGhjSjVX?=
 =?utf-8?B?Q0N3N3I5WmdsWnZMOVgrRWFSNk53MWsrVHFDYmFoa2RVTlhQMXl6RDFRTWsw?=
 =?utf-8?B?ZjBqQlpOU3RqeTdtWVBVZUtrNE1KUDJIOEZ5dU9EOWs5U3lKZEpJYjN6N1R1?=
 =?utf-8?B?aUI2dlBmSTZVazQrNHN5SlBBU1lBV01xYm5FNjgzMW1zTjRKc2hQdWVzTE5S?=
 =?utf-8?B?VnU2MkFibkljdHlMdDFzcFl4eFFsUXJORUlRUTB5RVcyUDV0WEdHZk9zWVVT?=
 =?utf-8?B?ZzJXMW9iNlBUMFBuVDdZbHFLd01EV1drcC9SU0pGa1ltODhmRzl4aURpcHE4?=
 =?utf-8?B?bCtGdGpHMXFteG1rL1JURUhIN0poSSsyV0k1bTRnR3ltYlUraWZINEVSZDIv?=
 =?utf-8?B?SitoTGZLMERMWWdBRUxHM2x5T21qWTlneDB6N09iNGtsSkFwTWdDNGdwNVNK?=
 =?utf-8?B?Vm9tNFErb3Zma055WHFxSjBsOFJTOWYyaTU5SkxBLzVaQnJMMDBubFc5U28z?=
 =?utf-8?B?cW5zWTNmOE42RThhYit0UURzWmZXUW9tbHVZR2puM3poaHUxOHJWUDN5VWJo?=
 =?utf-8?B?UmlTTUVxMW1RdVNaOExpU1V2N0RHRWpXSjVhMUUvekNEUE92ZW9mM2Z6RGV5?=
 =?utf-8?B?RjRRUXQzSlp4Z1VEODlhcE5UWm0waVh1QzVRbVlWTmFuWU53dFVBNHVLZk5F?=
 =?utf-8?B?ZWZzL1pCREpUMUp0bWsycnBVYktiU2pQQXA3T0tWdXNlWlcyZSt5UVdUSENi?=
 =?utf-8?B?cW52Y2RJbDlxWWhoZGl6K3V2NTBFWHptNm80UzBmdzRoMWV1bXFITEdkL3Zp?=
 =?utf-8?B?K3NxMHgvaW1oZGpQOU0yN24yaWlzWC9GQVFmVWQvOEJuV2lLQ1pvY2Vybk9N?=
 =?utf-8?B?UERDUkFMVWhNN0pFeTBGbGtkTitVNWgrK0h4dXB1akZPSDhoMC9pU2JaWjNp?=
 =?utf-8?B?bEltOVNWL05WYk90Sk5FcEJaMTBmMFRWRGwwT3FhUnZzL2ttTlJRREl3Mjdq?=
 =?utf-8?B?L3RWZitISXphUFVzZEJOa1VpTElVU2ZmWDJmTXVVYTZncUlkS280d2s1QUpD?=
 =?utf-8?B?UWtFQ09qU3Z3TE96WEJHK2g2UnpmUHdQZnhISkJaMGhGbjI0THhBN29yc0NK?=
 =?utf-8?B?akM2SGRBdi94VkxUNHdvMkpzaUZWQ2p0eWZ1eDlPMHFTYU1lVGgzdGIrUUU4?=
 =?utf-8?B?UXFQN0xheTd1Tit4ajduVHhhODVlMUFWSmkyb0w5TU1yQ2F4RkEzenJiZHU3?=
 =?utf-8?B?cHEzUEpCZUFDc1QwaEdvOXI4Rm9xK0dqemJZL3F0UEVxM3dMbUU4V0NaMFdD?=
 =?utf-8?B?VjdqbzFTbjkxVlBHcVczcW9nRVdiT2ZhdTE3eDFlUGVCcXM1WUNWYk1BYVow?=
 =?utf-8?B?OGV3MDAySUhyVElVY1p2T3VtQUdmTnhubld0WW1BalpRWGRQSXZxclB1ZXVD?=
 =?utf-8?B?eHlGb3J5L2JHelFJdDFtSlJqd0pua2w3bEI4ZkQrOEtLYysvYVJoaW8zWURW?=
 =?utf-8?B?bmdGNGJzY3JQcURMblBLNTVYWVllRlY4bkFKMy9MY0pWK1hUSGlUWXorM1NL?=
 =?utf-8?B?ZzNDT09Dd1hwcWh2ajJoN1A2b3QzWm1seWp3RG9KYXFwQ0dzNkRDYkZDK0hP?=
 =?utf-8?B?OHRZeHBWOTBtT3k5ZldYR2ltYS9GSkZ3RWdVdW5MWTFiOG9mNWZNNWcyWEQ0?=
 =?utf-8?Q?upu9Cvo8Oeov1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MUtzdmE3NXFHQS9mdThXQ0xVWVozc29tckcrRFRudmhRZDlEazMraTljMXRH?=
 =?utf-8?B?QmRsR0xQVjI5R0Y1K1hzY2dqbXZOSkF6aWQ0bldKNWVoLzNDcWRRNnRMbWpX?=
 =?utf-8?B?U2ZYMW56NEw1R1ZGYlpTUzdoazV4Q1lZNlNQQnRsYWZ0N292eHJVTDFobGdz?=
 =?utf-8?B?aUVjUXA5WWRNMEpwdm5meEFzTjZmMWE3ZC9uMmZsak9iTmZ1UmxaMXdkOTNy?=
 =?utf-8?B?MDZNSXI0TFZSVFZ6V0x0MThlVUhadW8xaUFkRWZTRVFpTUxqM0tzWFNQbU45?=
 =?utf-8?B?K0VjNmx0YW0zR05qY3dNZWltZVd0TVdCdmpxTE45SkI5VVlyQ1FINU1mM0Rm?=
 =?utf-8?B?di9RaTJhVnl3Ri9KeWpVeWg4WW9YNWFnam1ObFhlVTRCaVZQcWFaTWVoRmFU?=
 =?utf-8?B?cGVTL01hY3VYcXkrck02Tm9RV1RkbmNLcGxMbFhWL1UzTEVQalZ1SEtzcUZr?=
 =?utf-8?B?c2lUZVRuUE9xR2tHZTZkOUwzNUg2ZnFnVHNNQTlGa1hFRGU5aG83aDFUOFJY?=
 =?utf-8?B?ZzFIUDNUZXdTcDcrSDNnUit6OTl2TC81Tm0wTWh2VU5nR1FyRlZXTW9xcmw3?=
 =?utf-8?B?akppaFZWUFhySGs3MGFVWXJMN0FBdEZoRDJscHFIc2hjNitYNkZOQ0dpNk42?=
 =?utf-8?B?aGlJV2NmUTcrZ1NPVlhHQmpRRmhoYXNqcUhDUFV0cEtxZTNQOHd6T3VQYkMy?=
 =?utf-8?B?ZEk5RTZhR0oxelZHOGdPeHZHbGhBWlNpNzBESTNZL09aRGY4dGU5TVFUa1p1?=
 =?utf-8?B?RjRoTWdLaHJvZ0prVG5IcThRRkpTQnZONzh1M2d5VDhXcWQwVDdJOURlMktH?=
 =?utf-8?B?aSt1dlFkbG5MVzM0bVBkYUMrYXRvU0dLWk80K3YxNVJJMUdkbG00K3ZHR0JM?=
 =?utf-8?B?OUZFcWswZ0pUYlAwZ2V3WEV5K1k2bGRhRHR1VjZ6dzFzQTdRclFPbGJ0SXZt?=
 =?utf-8?B?cnUrekNOUk5tajRSb3M3U1Y4cTFYVVArMzRIYkRObmNweVkxSWErWGsyVTFj?=
 =?utf-8?B?Qi9KemZLZ2N4cVMxdVlpRFJyMlk1VGZ1eXMwNy8wbyt2eGM2eE1lMjJrT0pI?=
 =?utf-8?B?aWFGZG9MbGxoNGlPejdLdHMwWUsvNUk2QWV1aWx4WjgyT0hpam82TjlrVkFJ?=
 =?utf-8?B?a3QvZzFMUis1NlEvYTJVVjdreTN0TmV0SUpzWmZFKzJZSW92R1RQa3RHL2pn?=
 =?utf-8?B?OFBNL25MNWI4M3p6VTRtSFQwWVVPV28wbC9qOHBTUy8raVU4NHlKQUJva1pN?=
 =?utf-8?B?THVhSk5jdUF3RGk2NTZzZXhIK3lCRUNad1F5ci9jbkFHT0xQTFZLc21kN1g0?=
 =?utf-8?B?cUVvckJibEVyMzJJUmthRkZ5aDJucDNmVGNCYktlbkVrYnc1UGtQdkt0RE9Z?=
 =?utf-8?B?TzNCZVBKL05rTHRjSFdleng0aHlkNmVycHlQUFk5c3lIdkNDODlmWHFQMTNm?=
 =?utf-8?B?OWJ2QllWNTNPMmRWN2NtRjhTdVdaNTQya29oR0dQcHdoWnNhRVdPWkVaSnI2?=
 =?utf-8?B?cGM4aDgyckdXOXN0QmJtWnhxSS9VOExsRSttclBjbWN3VmFINDd3bG1kTm1n?=
 =?utf-8?B?bU80Z0g2Qm9DY0ZCbHNBcXhNUitiaXRLajNYSmdibCt0OVhlbEtIUVdpME1O?=
 =?utf-8?B?dllxN29YV3d2amxNVG51c2JmWGxhTm9hcFpydS9xOFVTOTQ5MUFhanRyWEp3?=
 =?utf-8?B?RzBBM05pd2dneFRpSHFoMGcxdm9vWVhYYXN5YWxVallMRGMxOS9ENjdJcW11?=
 =?utf-8?B?MzZqUnVzRkhLbnRNQU5HUTloODlLRnU1bmRMZWVCdHhFemdXcXREQ1RjT2tV?=
 =?utf-8?B?dGphclpFUGlzYVhQNERRajZhOWZZbFhvS2szSUppcXlSc1Q2bDRHK3M2S2lQ?=
 =?utf-8?B?czhnNGFGUGtQVzNrWEpSMXlBYWZQQXBXUy9OQnZDK1pCYnV3WGVEVmxHdGVB?=
 =?utf-8?B?a1FCcXdFczNjd1ZocytZR0FIVW9lK3J0eWVmSGp1WlV2c3N0cThFcnphN1di?=
 =?utf-8?B?UVowMGZNSU5qSmR2V0Y2NjU1V3dRRUFwS0x6Z2ptNkpwWGRXRHZTTEpQcUdP?=
 =?utf-8?B?S2NkOXFLdzI2cUNzUWhkNWhMeVozL3p3TERTWkYwTXAzNXBrdUxaUmVWZk8x?=
 =?utf-8?B?Z2JtKzZoYk5tMHhOMStsZi8rVk9KTkZKbHQ2Q0ZtZDFCV1Q3M3ZpNzdESDl0?=
 =?utf-8?Q?hPP2AX91CNBmNmb9QjnN2eg=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 96551378-4f1e-4c5b-cd5c-08dd4a8ba5fd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 11:03:00.4242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSdw/gU1vh3/AXtML0PiY5EipBD+K+Befc6moZqmziLzYDlaI7t51oP8chSfLQ1Lg/p2OqVBzwHoP2EFjVSF0RlWaBxNlGkhgK//BpdfzUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8693
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 11:03:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6331

Hi Antonin,

On 2/7/25 5:28 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Rename this section to explicitely name the multiple configuration feature
> "multiconfig".
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

