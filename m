Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830C8E7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 10:40:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.76])
 by mx.groups.io with SMTP id smtpd.web10.78608.1734431999832699600
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 02:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dMWenMdw;
 spf=pass (domain: cherry.de, ip: 40.107.21.76, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycq0qBXKNJRR5Xd2aI6jeOsbMoXFyOJR9kb05MtbwWlc9dacdGjrqpZY8YqRo3MS8fiUaYw1vzXnas1Ha+pRAYusTop5HLyoK8bNu+e3UNyNRbjYCXb5+5TtdZf8Ambc1Ro1djYX2Lze8QFzs+MYKhJfvZXAk/K80fBa+Se0qgo53go0igCwpbWRg54Hedh4mm70uM78sxuPcWJUOdc9BS+Muk6ChbdCQGN+A4vO5YGsM4vU+sro12SUbi12z2xL0EcKQlGgaRacq/4zUwsvKDTyqfVwwCHHE/yUThGxIeQvYTh66XDUs96aWrYbuKhjJPs5NXCdznL0xqvTiWU8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92HbvIdDW9L0i0xmHAi7bTSiy8Qrl1v68/ri0/qTCVM=;
 b=DZJnr2SRbPrV5/suEuu5cjSgi5CdN9JHArZZ81L+nYpnwVXE0uAXtPKWBzb1bKQzi3SveQbzjYYUyCnSNO/YPIrZRE9E7q14+oS4wrsKWO4CWYA26bb/XIZeO8xIgZ9F/reSSWIGdbrd5vxKCBE4Y0oGtntj/wbjWHJl6akDe56q4gYlLEw2YmZ9AovGWOrRXJjJAJPt8289z3ZdZWRLNAB/1hXmqbhGHGQwIvYVoVpsoEvRsi+Y7RIswG3b1JD9478/LPg7Nq2eUQySVisqlOFH8IjzJu4VIZ8P1pLgkyxRwwPM81SaJzhGX6x6r6iqdQeNaljG1+RyQw3FNMDIsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92HbvIdDW9L0i0xmHAi7bTSiy8Qrl1v68/ri0/qTCVM=;
 b=dMWenMdwJ8CSNWf1dQLAnP03X22wqHzSnXxmNLCacfVQ2qRArwcCXvrAGHRZfd8+4G8hJ/l0eMB/2j6pz4LXph3hD6LwxBaZhkxaIWHCtGYTUq5xSckptCCuKM94qKiUVdQd2cukDCWELMQR60n/KHdcvxWG79JG7T7elL6FxM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 10:39:55 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 10:39:55 +0000
Message-ID: <1d801848-945d-4882-9635-18a4fe4f41dd@cherry.de>
Date: Tue, 17 Dec 2024 11:39:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 06/14] ref-manual/variable: remove
 obsolete SETUPTOOLS_INSTALL_ARGS
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
 <20241217-release-note-5-2-updates-v1-6-b189493b1b09@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241217-release-note-5-2-updates-v1-6-b189493b1b09@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b069514-32ea-4128-c8f2-08dd1e87251d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V3gxMEU3NXNEVms2RjdZdEVSTjBTK2JQWE9pYlEyMWxpemp2MGQ2ajAwQXpo?=
 =?utf-8?B?VHltMThiWU9IVWpDaUJjcEdvbU9nT0gzbG5yenAzcEk1MWZnOFJaN2FQdmQz?=
 =?utf-8?B?SGZZb3VhV29sbzg2dXRyRzY2YThZQnZieC8xSkE4NUR4WVJwUmdJYXJxMEdn?=
 =?utf-8?B?a0ZVK1E3ZGtqZnB6bGxaZVRJemZJNFhISU0yZERUWnkzUElOOEhaVUdyRURN?=
 =?utf-8?B?ZCtJTHVqMjU1aDJ3T2dLUjJ3S3prMXVkRlY3OWpTYU1SUmd1WEhwTm1LKzla?=
 =?utf-8?B?N0pETzc0U2lVaWFpOXF2cENOZUVJTEttUWVMWGxFK3ZYM1FoSzR2QkZOQ2U5?=
 =?utf-8?B?Z2ZGOEFqYnNTcnFQbys3TzBJQVZtd2Q3MjJ5M1kzNTBLb3MyUEc2a3RpUjBi?=
 =?utf-8?B?U0YzUkFUNUV6QTlHSnFvQmVBcy8yeWh0NTRGZHM0TlJNa28zaDZtZlBFSURO?=
 =?utf-8?B?LzhpYmFFaUVLU2xTajhkZ0VKRi9GMmYvU3NDUVJUa3BHdGQzeDRsd0NFSzg3?=
 =?utf-8?B?MS9uK2NScGR6WFpzQUFFU3pDOWlsQ3A3RVBWV2VMdWp2L0ZIb1ZSKytVa3Rh?=
 =?utf-8?B?dFh0WjVxUGQrNjhNMG94QnBOQTFpLzYwWjV1cThaVGt4eTlyL0JNc095MnVo?=
 =?utf-8?B?ZHdYYXAxa0xjSnpmVjZ0Q1BXTS9CeklNbHAweGdiN3FINU9sWlp5SDc4STM4?=
 =?utf-8?B?NXNUeXdiQUFkakRwamMvR0ZocW54cDBWeGFrK1BpbHJsVXkvcmRyTUcydG9j?=
 =?utf-8?B?Mi9RUUFVTHB4WnBRcmx2MUFmK1pEN1JUU1dXb2FNaTU5NU5ueUg2cDh4N3JI?=
 =?utf-8?B?MlRrOVRvNnVDK01JWHd6QVlNaE5NSE14VWgrdmI5QVl6bGE1UWZYL1JoQWdw?=
 =?utf-8?B?Szl2TERtTkxDSjN3REEzQmRUYnEydFc2UFhtUVc4OGJvb0k0ZXoxMCszVkl3?=
 =?utf-8?B?Wm5aYlcrdFJoZENHWDdtQkVzTVNMWGZyV1lEcXZ6QzVwaUNqSWNXbzBWM3hJ?=
 =?utf-8?B?NUViOVY4cEpjSzdsNU8rMElUR0JiZ09yRWRjd2R5OGlTZDBFNFk0Rlhja2VS?=
 =?utf-8?B?OG5raVBOQVpsajJNMHBsMmo3dmd4NzhqRXRuQ2dieXJweXcvdFlnaE56Z0dG?=
 =?utf-8?B?YkFTRFRlelo1cFE3UWZnTmcrbHZvRWE0UzEwN21tRFE5OUJJUkRUODU4Mk8w?=
 =?utf-8?B?dkt2UG5RNzF3ZjRJaWcvdTZoakdOMTBXcDlaUldRdlc0Vys1RnRpcFhWWDQr?=
 =?utf-8?B?YkZSc3NkcGdmRkZVSWRzSDNqYzlwV1pWMHVSdzIzZ1JNVDRWR0d3VnV5ZFVK?=
 =?utf-8?B?a1VFektlUlJXem9RK1VXeGVmSkozOGszc2xPTytxRUxBSmpCTjdQTjZtOHdO?=
 =?utf-8?B?NXlDUVR6OE9aenB0ckxrdUZsdjQwTmR4ZHJqaXExY0tOcVhFVWxyNjl3eUZz?=
 =?utf-8?B?YWtQbVZjVVp2V3N2UUFhdzBLSUFkSGVWZERhaWVwME5UY3IxdGM4anpHbXYz?=
 =?utf-8?B?cFlQQjlrdTdxQkJpM1ZJRU00YTFheTlUZHFIRWxicFExT1BUZ0lvMUQ1NEhK?=
 =?utf-8?B?NWZjNm40N3Q5WklMNjR5SWN5Y3VJOW1RaGc3ZnFyQVJ6cG1JRGVGUXdIRGt5?=
 =?utf-8?B?NU1SUkdHcGdEa3ZqckdKc0d1S29vWEJEY0prSVl2V0RIL3hhYktKRU5SWG5H?=
 =?utf-8?B?QW1UYzE4YmxxM2NqMVltRjRyWndELzRqaHhTM05YUHZkMzFpV05BbTZZMFk4?=
 =?utf-8?B?REVjMWo5Y2xwWEd6RjVudE41VjJzNWVza2xrejU3V0creVpQS2RDbjJjdlp3?=
 =?utf-8?B?OVhneEdqbmE3V1hlS2QyeUVqZjdkeFd0Z3lnSE0xYXBpUnA1Mzk2bytRUHRv?=
 =?utf-8?Q?NVaIjEwXdOlwy?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WnpyRUwzejFrM2lVa1hPVkpVN1lQK3NHZjUzdjVYajNuSE1ac245THhBSkZs?=
 =?utf-8?B?elR5a0d4c1IxZ2paUUhSUkJkRk1lYVYrd2djTk4wL0RjL3pxSWdTaTl2cWsr?=
 =?utf-8?B?ZUJQazVtUEYyMkY3cVo4NzUzZGllQ0gvWG5XWVZmbGRtWWFRbHJQbGpLc2Qz?=
 =?utf-8?B?WTZ4c0kzN3Z1L3dIcGhSZ0xwYUQ3b3Qvc0RlQ1M3dm5TQTdNclAzamdoTU5l?=
 =?utf-8?B?S2JRemhmWWZSWUlmQnBnMjMyOWluS1FERm51QkMxa2pVc295cVNEVG5POWxB?=
 =?utf-8?B?QnlQdFZIdWVNQkZlRkRISFhzUUdVc2xKdkN2NnJ4YVNNdmF1cmFML1VncnI1?=
 =?utf-8?B?UGdYaWtoSFcwcmlKVWJZZjdGelVBNmlYMnZXdkpPWnJGK0JzbE1TZ05OVGo0?=
 =?utf-8?B?UGpWNXJuaURmMnV0emhJdis3S1VJUmw4aWFNSXcrZ3B1VU45czBEdXhjUmJ4?=
 =?utf-8?B?UTAraHVSMG93aEwwN2c4SDBLdzBqQjY3V1hwRnpxbVdkMEdMT0s1RDJrZmc3?=
 =?utf-8?B?blh4YWNXZTBjV0krTFo5b2RYWExwbFlnU0VnSHVxaGN0dmluVEtiUzRVWHJa?=
 =?utf-8?B?b0FlcTlrQm9wdXVtTEFNWHFlVFJGcVUrVFNGNlhiMUxUdU9UWXVNendJNXBC?=
 =?utf-8?B?Q3p1SVJ0a2dZNkZHbUU0aUEzMWpvQ21Ra0RUeXBremNEdEpHa2tXZXR0UEUv?=
 =?utf-8?B?b1FmdGpkVmdiUDh3MnVPeFdBZXFCK3VvS251T2JSdVBHamFIa1dwZ2VPT1BO?=
 =?utf-8?B?OE9qbFA3L3dCb3pYbVErMW5BbTJYYjhPYzNZV0JJRFMwYXVvRHhJRFJyMC9m?=
 =?utf-8?B?NHVXTmVPNWVMd2g1d1VDT21aeFZyam5MK0gyMElMdzJRQytSQVFWMzRYU0Vr?=
 =?utf-8?B?MkJmRlVoenhTdnZvODRvamV5dGUvQ3dDZFFqOW00RXlMTllVNzIrK3VuUFQ4?=
 =?utf-8?B?ejFobW1RazhFWG04OGZzTEFFa1ZxNDdTT0YzY3Y2ZDdBN1R6UThvUzN0WGVs?=
 =?utf-8?B?dTJLSTlSWmZ4eGpoWGFYMU1zSmpiajZHWXdWcGZLSXluZmFUUVd3cUN1M000?=
 =?utf-8?B?SkhTam5GTGdyMllzS1p6NUE4YytnQjFCVU9lZXNxMS9GN1Y1Z2dMTGhPK2x2?=
 =?utf-8?B?V0NXMTJDUmRQUHFIMWtoNWVITHMvZGVUZUhUbmNhVGtnNkx6WHhLZ0R1TFNR?=
 =?utf-8?B?SDl6Mk1zU09SaitzeVBmWEt3Y0dzMkdnSjh2VUdWV3RLbUU4MTNMcGZITVlG?=
 =?utf-8?B?Z0lRbk1lR25oc1EvcDE0YmpxS0IwL0FLdVFobnFETEYvc1EzS3VJTTRGUXNX?=
 =?utf-8?B?djFjUlJWUXY5aHZBNS9yOGhQRHRONm5TQSs3ZzVOTmdFM1NZNWg5cDFsUDNC?=
 =?utf-8?B?L1ErVjl2NUdFZUtKV0p0RFVpNU1pNGN1M3N2RzZnU0NuVldGNXV6bGNnd1Fk?=
 =?utf-8?B?bGY2WHJna3AwT0VIUG9mQ0ZSQWthbGFMMnEzSmtoekRqK2t4ZTNOTE5sOHQx?=
 =?utf-8?B?NHpDSk9HRWs4WHBEV3pNWlc1Tm4rSFVjM04raU5SUEgxRVpnb1M0Z2ZvdWhX?=
 =?utf-8?B?RUNNS1hQTFVqZXBDZmRRVDJleG9xU2tGYnU3d2NWS043T1l5bk5PdEVqaGtI?=
 =?utf-8?B?aldxRXpNam81dFFGTStyQk1NL2YxWEdZUVp5VWdmUm50ZURKbjVJVG5mU0cr?=
 =?utf-8?B?bWxJUzJka2tCT0RNZVlJb1ZmeE9wVFArUlAzSTVWMCsvSVJ4NTJ6M2ptcU5Q?=
 =?utf-8?B?aVRaRmk2VDY1UlRvcEV4V0V0UUpWK0FMa2hiZEpnTng1eFNMZDRib2pDeWtt?=
 =?utf-8?B?UElCMmVDMWE4UDVxOWg4MTZxUFQxa3cvZzZZeFRYQlErRXEyeGlVdVM0NXJI?=
 =?utf-8?B?eHdYNG1CN2VydkQ5N3pFVmJzSjFqVkpZWjNjblJLak9lYUtNcmdLVzFVWktZ?=
 =?utf-8?B?MEhyTlg5Q0JId2NDMFdKRGlxeURYUkNoVFhBS1VNZHl1NGd0UmROZjZvVTVZ?=
 =?utf-8?B?SDI5Z2twVEFOSlQ4Z2l1ei91ZXJuYzFqLzRibzVsSG5rUDkxMlhUcE5adWxX?=
 =?utf-8?B?T0JtekNHVUd2bFFBY2FvbUNIUnFzZ2JjQkNTcWJKVGZ6S1pEbXJGZ08rTVQ2?=
 =?utf-8?B?alQ4TlZSYUMwQ2RDNlVaOWtvRFhscExjNVkraG92emJ1Q3dUTW1yS0FmTTJQ?=
 =?utf-8?B?U0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b069514-32ea-4128-c8f2-08dd1e87251d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 10:39:55.0191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bvbw5JyD1nUQyqwtVrMwPSrQHUYZ3tnG9ViKgDlHG8vo5ckWEuT3GeM2by4RTrwKOb1n5etiTpMQZa9LyVSk92FKPkLgsXd825RFXw2QFdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 10:40:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5958

Hi Antonin,

On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove in oecore by commit b4bdfc78e8e1cb8b86221bc55d80d601ea1a065f
> ("python3-cython: remove obsolete SETUPTOOLS_INSTALL_ARGS").
> 

But actually unused since 57c477ca13e352b6f9b21385abbfaad9778c6398, i.e. 
from Kirkstone. So I believe this should be backported (and added to 
migration manuals).

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

