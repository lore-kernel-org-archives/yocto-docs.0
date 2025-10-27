Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22217CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 13:05:25 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.16])
 by mx.groups.io with SMTP id smtpd.web11.32083.1761570314723499208
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 06:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NsZ+1bth;
 spf=pass (domain: cherry.de, ip: 40.107.159.16, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWW4ZyuVnoUBcE5Y6dufwstxfhrH0hxonRSsAaInUUj+/F27OIxUrgt6oQuF1th5RKfPUM3PVy2+of9kB8TNTPgwKY6nwVHYyaslQ/kWTznZ5f1z9nheOoTMypNiMDm0KjFOUIm+0956gp6gfi0wU3PMoAoXNjpjQVKxHvdeGXAcoR7saS74BzQeJnvYweFS3v9dE1bIIQ0g6kDOurgFmFuk3hcfcluCtESTAEOgTtaOi//SiiYEPfENAMduMWbJ8QrXz4bYdqtI34O1+oLxH4ixNngGUBM0erNSavUZGHcOJ7PuHdvVHXk37/eGl6HJeYQrCKBL+2RU7OTO71WyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4nt6XmgFii3vj+NExZGkZ64MRTLWd676wOCYmhdT64=;
 b=QVrGN+NLWBUzNKptdRmgJDYC4EVgahs2ciuMnyAu5/wJDufoSmd6O4kFpEGxOcG9gEzeQDCXIuRvPqC+f7JQ+7fd+oQFQllMcYWjKpA0yhv1KBdU1oJ+lXO6Z6/VtkiNjTxGmDtf9pcQT2yxDFHnr5PgComIqeYkkY7/Dou+VonS/25Wzkypke+ePVWGxhjBp07oHdn2QaqEP1CzQINfT9N2iNzcl0L6ao3kNY/YiBhIuHyzAylaovU6DAHI4DKJfW2tSUFprN4Z3x6MOiG4CIWPx9ghMY59tjO6B81KHyITOSLNQZuBwKZ6qG8nRxLPHI3Ggy2D38Sf7gU5x3gk8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4nt6XmgFii3vj+NExZGkZ64MRTLWd676wOCYmhdT64=;
 b=NsZ+1bthC2UyXfDkjkeXGr8dODBU/Nbq3mA8wUGPJH1+KHziFcxYhUQ6a9t9jP38Rmy+R5M9J5pvdC4a1PGiAPTIgn+dd5uHflEB6ZP1Ukombj3TJE7xBLRdDuLO6lzNa/vnOLWhoXarlQZK/S/zlmOSPp0FpEioYv6p0GWyxoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8781.eurprd04.prod.outlook.com (2603:10a6:102:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 13:05:10 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 13:05:10 +0000
Message-ID: <c81e3d54-db9d-415d-bb01-04fe7bad315b@cherry.de>
Date: Mon, 27 Oct 2025 14:05:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 03/16] ref-manual/classes.rst: document the
 python_pdm class
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
 <20251027-release-note-5-3-second-hunk-v3-3-07d36e2380b8@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-3-07d36e2380b8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 681ad0d9-8527-40eb-34d2-08de1559759b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cEZFK1QvZTZ2U2t6Z21CdngxRUZwQ0FZUStEWXB2bi8rNEJmWUV2SCszVXNP?=
 =?utf-8?B?Q2JaYWJKbmx2N09ZVXFUWEZrZ2hBM0ZHWGQyRVNSYkZuY1NDRmt0UlBvWEFB?=
 =?utf-8?B?Tm5kODQ2OXhOckV1MUNVU3YzaS9kbnk0YzAvQ29lL3hjOG93d3d2Z0FJTTI1?=
 =?utf-8?B?TmVBU3B6dEd5cUE5MVg0N2RMdEdhZks2bzNXSTZTUm5tNk9TOVh4SjBhTkhG?=
 =?utf-8?B?ZWxJSkJ5TGFSb1VRVG1idnU1Z09YWHBEa0FRbFJ6S0M1ajRnVlNsN1dQK1Az?=
 =?utf-8?B?Y1lOZ0VoTk4wTnlmcURETEtObXJYOXRMeXZSajd6VnBvN1NSM1B2S3JlTEJX?=
 =?utf-8?B?bEhDSHpaYTkwTEZTRWxWeDBjQnk3b0drZlV0SGwxZ0tEeGh2N0dDdzI2UXZq?=
 =?utf-8?B?b3A3NnJlRmhPZE5mQlNlK0dySURxNHlnalJmekJNWGVJWHVZdHBzSE9DR1RR?=
 =?utf-8?B?cXp3TEVkeWhlMk02UndjeVFPYXlVaWlBS216cWpMdGhMRTFXS1pnMFZJUUdw?=
 =?utf-8?B?OEdIck1xQVV1M0p3ZnFUM05QQWZIUUxkVTVjekt3VjgrT000UmdiMlZWMk85?=
 =?utf-8?B?bXcxTlZLL09rSXZxQlFnME5Yd0szaWplMWpBa1BNczJHVVhOdnBzamlOQmFn?=
 =?utf-8?B?Z0dQaEEzUHp2cU9PMTRYaFNJL3NpUytXelJZSUdocnEzQ0gwNXEzNGM1UTQ5?=
 =?utf-8?B?clVCcW9sUlhMSitmWHBqR1ZDVCtYYXZTSGNZZUcxL3k1UzJiQlQ0dHN3N0M3?=
 =?utf-8?B?c3ZmVThNR3lsWkRpNzNpM0xOWlg3RDdibHlhdUxzdzBkZkovOEYzNCtxb1Fi?=
 =?utf-8?B?bVFsRUpycXFZbFoyTENqRm91cnBSVlpGZnNkSWVsbWtYbEc3ZitoUVhjWFFE?=
 =?utf-8?B?anduWDlNV2RsM3RQYVhZOUZlQXE2OElSRm4weEQwdFB1ZWFocDJXLzR2ZnFN?=
 =?utf-8?B?aU5jSjZFbjB2djNkWVBFeVRXdGhuVTZQVHA2UkJHTGNzQWpvWlhNOGdEZ0NX?=
 =?utf-8?B?a1ZmaytmWVMxdjRZWkprcGZ3OFRkVGlqRlJRc2g1Nkhvcmd6WjVTVGUvWGR2?=
 =?utf-8?B?SEZ6RDNZd2ZHOHZnN0RkUThmN0F6S3FCQisrUXN0NlFCK0trY3EvOE1IcHFl?=
 =?utf-8?B?a3lrdlgxZ2NPMEl4aDd4SFEzLzF5a2pLUWs3TXBBSk5WaTNCUmNOU3A0eUhB?=
 =?utf-8?B?b2Z6ZG5TMGpndk1WUnREblk5T0xFYzZucGVyZ3pFT0ZCUlJXaXcrQXRaUDJi?=
 =?utf-8?B?d2VaUytjU0lYeDJwZE9VMEZXeG9zblVsOHlFMkMvdWVzTW04RlVCZlVYcVhj?=
 =?utf-8?B?TkNPZSt1MUVYMnZ2WWdhUXoxZGRMM2hIZlRKVlg4NkVuT2VEdEdSWHhFMzUx?=
 =?utf-8?B?NWh6aVVaTWlPRHppakhZS09IWGlpQzh0N1JYd0dYS1ZKU1RTR3p6ODZweUFP?=
 =?utf-8?B?QW1WOUlFWHpJeEg2RUFnVVZWU3lHQzNCWDM3L0FHSVkwMXVjSmhWd0JPUVcz?=
 =?utf-8?B?cWdOT2x6QnFwYjRHNVBINnlJM2Zra0w5Qk5FcDRHeG5xWTNLOFo0YXZpR1Jn?=
 =?utf-8?B?NFpZZVRSalZKbTRpVzVoM0hGTS9yZ2xReXhjeDBFREovcDcxNytJemFjaFBV?=
 =?utf-8?B?NU5uRXVaL0M3ZzQ3dlJHNkZFM3RkM29wblZmdUtMekNOaFdCNCtmRmlVRmQr?=
 =?utf-8?B?SHRJbVhCVGFwdE9nMXg3c0dncFVWZlB5bUFRUWdqOUg3TjhkWGhJM3hGQ2Fk?=
 =?utf-8?B?SDZGTUZxSTgvZms5ZXJ0SDF5Mm9XbHlzZ3U0ZVBvdnVxWEFVZHZJTlFnOThE?=
 =?utf-8?B?ZkU3ZG4rTC8ya1Raa09PWnZPaFphV0dmd3RNS3AxWU1hZ2JqL0RWc2lTbWpP?=
 =?utf-8?B?MmVpMm11UVU5aTRobE03bExUMFQ4UE15TkFFMmprb3llSVRrRUJBdWh1Y1Rp?=
 =?utf-8?Q?Mpa5U1aaOGzElLaOmYCzoT3Qs43Tt9bL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WVdrb2VWMmJ2SjJvdGErYkw4bHNHVjRBTEpvc3lHRCtWbkNmM0ordmlTTjlh?=
 =?utf-8?B?VC8wa2Z0Z3lURG4vd2U0d3QyUHhTbGU4SCt1U0JKRlFrTjFKZnYxTGdMY2U2?=
 =?utf-8?B?SGcvclprRWZCWHF3eFZxVWU0ZTZKTlB1YWgvc1ZGK2VpZlMyT2twa3ZWcWxa?=
 =?utf-8?B?bExQTS9XS1gyZHBsQVExKzY1MU5zeVdIOEtzNzhicVlBRGNKVXkwVkFNc1I0?=
 =?utf-8?B?Rk41VENpK0RuVEUvRm1XTENvTDJDNnUvZ1pMN0oxNk1DRWRWVXJoZjE3dnJZ?=
 =?utf-8?B?M2FVb1BaWHcvOEpaU3FwZVFqVVZiUktTQzlSMmNoejArUDNSeDBLa1Z5RUNs?=
 =?utf-8?B?cHZtQXV4eGtxcFZVVFRUR04xZW5ORHY0SFZxamsvZ3BBSVNwVVBlMUlIT1ZC?=
 =?utf-8?B?RHJUNDRXcGpVWThsZTdrNFpWck1QM3Z1TDkxVERuWE8xd3NWSG1CNXVDcERT?=
 =?utf-8?B?ZWxoSW93OXNjL1FlVXlRaWlsSS9jRisxNkFmZEgveW5la2ZRanM4ZUV1cjlI?=
 =?utf-8?B?WWV1WlJDRVplUFdKTUFkTW5jTi9HMWE5bE0yNEI5QTRwbWtvaUJHRmVFenZQ?=
 =?utf-8?B?Wi85U29Nejd4NFlKMlYxTG96ZUhWQmRkOWtDdVV6VWJOWEQ3TFhZQXM2eU94?=
 =?utf-8?B?UXNCRVRlaW9UWWFQcVhsU3RzSTNwU2ZXS2NRak5YenYvQ1ppdzEwRWJTbHdj?=
 =?utf-8?B?RXl3by9zODBDQmFEY2h6ZDlTZC9rc3ZsTUdiMVVBNnBXK2VuS1FOZzJkall2?=
 =?utf-8?B?SFJsbmNMMklVMWFGWVVBSkJIVWZsT0kxanNHNGRLelFxcFFBYVlmQVBPaExG?=
 =?utf-8?B?SDNvSjVMdGFkVXk2cmpPY3NwakFaZnhqclM5SEQ5eUhTQk00bXc2YTJLaHpD?=
 =?utf-8?B?OHJmMld1OUJ3dDJRUi94aXRDVnd5WTk4RW9Gak1XakVFYUNOWm1vVXcwc1VO?=
 =?utf-8?B?Q1RZRlNxK2s1QXFtMEVuYlAvN0tmcG9RbWQzbEdVY3NnRnk4MHdEUVl4enF0?=
 =?utf-8?B?SHM1d2ZQTDdFc1JYc3pwS0huTXhFTkdicTJZWFVzOFI2OTRtL3ZGSlZrRmFH?=
 =?utf-8?B?RTJVekEzZzNhSEdhR0tQVW5QeEtpbFpDYU5na3ArUnRLY2RXU1VuSUFSU01M?=
 =?utf-8?B?QmZlNmJjNXBoZWR1d09TbzJadDdMRk5LMXAyRWtHMTZzMUY3M0ExSWVqWU9r?=
 =?utf-8?B?azM2em5xNjZLTXcwc2hTYmNlT2ZQcUVtbFBVeS9mQmhtQ2VOOW43Q1d6Ym52?=
 =?utf-8?B?WHU1TzJLY0kxRUpDd2FJYnVYUnRDZXhTR29Va09mODcwbFo0R2trSHg1VEQz?=
 =?utf-8?B?Mm9PWiszeE43TmhUaTJuZXIrSlJURWhNYThUT24yZEtGajM3ZWJoZFJZWEVH?=
 =?utf-8?B?SHJFRE9aK2FvRWZhcytnMXNrNVhMNG1Ca3pHYWV6QVpFQUUzQUNxL1FVc2NM?=
 =?utf-8?B?VWZHQmp3U3lXa09XcUxxck0yS2pjVGRaSzZnbXBQUGNRNmFQYzE1VEV6cWZH?=
 =?utf-8?B?dXBVUC9Ca3M4a25kODZ3cTFSaTZXUi9lQVIvS05ZTEg2WTVndndwU3REbnJu?=
 =?utf-8?B?aEovTUxqdjFKMmdIWXZYL0d0R2lzbFgwMWpBTS9ZSkxrWG5WZmllVnZyclpJ?=
 =?utf-8?B?UEVtMk1RK1hFTy9WU3k5N0JhUEtnT2Q5dGIyeGRKM1NLZW5NdnhPNzdyVDBY?=
 =?utf-8?B?ZVFqMXhpWDhzbFlHc2ZPNFozY1ZCVi9takRQQ05USGpQZWU1UlNQOTBNQXZI?=
 =?utf-8?B?VUpOTnFpVUFQL1VZQ3pOUDJYUWIzNFpTRWR1dmdaT0NldzlmRWY1NFppVy9T?=
 =?utf-8?B?Mk9RSmNGVHhMbFpmU2xGMDBKVFhpanJ4azlralk3UmlXTGJoK0FpNTVDNHlQ?=
 =?utf-8?B?SG1HOEtuQVFHZlhZRGhDYzd1OGxRemZreFRBa3d1aFNXL0pPemZoK1RaNG96?=
 =?utf-8?B?WDlhTXovTUQ2UGk3eTE3SlJBbnhvUmF6Vm4rV1V6b2loTkRveVlGeEY1Uisv?=
 =?utf-8?B?V0xEMTZPTWdoVE5YZ3JMYTBSd3hNa0ZhOW10S1VsVjRZRXZQVStiQW55VGhL?=
 =?utf-8?B?YkE2ZXp6TEV4SVc3d3IyYWt0czhFa2RUZzQ5YnpCeFVCUjBZSmpCaVRtTzMz?=
 =?utf-8?B?NGFubGp3SHozOXlPN05xNCtiUlNWNjM1VUFWUjZVRkZldE56OVM1SmF1RENt?=
 =?utf-8?B?bmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 681ad0d9-8527-40eb-34d2-08de1559759b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 13:05:10.4623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wzi/cMGU1Cy7aZgehirHiq+Ormj/3+faA5kE3pZQooi9uQ/NFYK4LKx9QX31O/VPTPGt+YqbHSk02oA+ghIBrVjAFiJKXPZ3TCocyAwvJu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8781
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 13:05:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7866

Hi Antonin,

On 10/27/25 1:43 PM, Antonin Godard via lists.yoctoproject.org wrote:
> This class was added by commit 20758865e9e0 ("classes/python_pdm: add
> PEP517 build class for PDM") in OE-Core.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

