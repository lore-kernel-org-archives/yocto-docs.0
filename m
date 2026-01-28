Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226F9D25B7B
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 13:37:13 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13018.1769607427558128566
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 05:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kmgg02zq;
 spf=pass (domain: cherry.de, ip: 52.101.72.11, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NObDae9kTfJ397PW8STzXF88bNtOMWFm+SyYUFwCOKrdVclM0tbjIq7s0IdyhRJO9d3KGw54B70dHXvlOuSAa5vvqBM0NG/7CoXJ8O0nzh3qDpSekFPMF3XYJWfZwzTFohc6cEDoipbOu5cPFiUI7PCQarq7t8eS9UT2mXPlUcKAaELmeQNHz11wkJq9wPu9j//nMEzZp3LLFwZe4xmNPmgo8buwBpgLS9ey3IxxKdVWZHssJ5QyICYH0ReyqLPBLrfrS2exN//BabXvKXv0NdznLQ/DdHkgSL6n0Abf3WSdUjDj5Y51GFA7YmV/JEdikvd+ESTDnFL5U1+FDJsbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsNydJg/Nfw7rK9hov89BqXtjDJUoxqs9TlqtmJv/Eg=;
 b=WaeZHYdMt2BMWRorvDLTllXGTFskJrDLwQ0npNT9j8XMZVtAHtaO6hd7AKSAhh0Le49tdkmh/a7oP1+JOArD52+92q/8PydblZ6okemHott/XgQPpf41eXZ+RM/7ycU5QNEb8em1X8OtSFHYwTvxBxz7/T3Ry2K9b4CT3dFkO/4KtTeehje7d9GcceE5N0eNhZJ8heMkDQ26tCclmm0BzDkD1UH5HGd2VoGh1hdDtANiYKsL6AptlGuT5G0HzBhCagbOxodDwaw0x6H802bNctKGTpDa69YM+UgcCrrBpeNkHn5bOq/YWls7Sl7Om8/YUpnRP/ZFZKKm9jzdPQAjxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsNydJg/Nfw7rK9hov89BqXtjDJUoxqs9TlqtmJv/Eg=;
 b=kmgg02zqVQE25ESDWK2ZBQoH0oHuwzLQzgqe52/T0NJVwUZa6cS4mqrTQKyhSPypPyBzALWVGgIvhoZCqt8Lp9gWOCZo5lGXcPDS0BGFroQTem8kPBkakQFowYQ3Wn4PopNf1E6Moh/vhgX92Ss2+aJwFuMvR7427Oz5DENsKiQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB10456.eurprd04.prod.outlook.com (2603:10a6:150:1cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 13:37:00 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 13:37:00 +0000
Message-ID: <4a4cc3c0-ab7f-4256-b64e-9028f5f9d690@cherry.de>
Date: Wed, 28 Jan 2026 14:36:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 29/56] sdk-manual/appendix-obtain.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-29-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-29-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB10456:EE_
X-MS-Office365-Filtering-Correlation-Id: 970b1baa-b349-40ef-58b8-08de5e7250a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c3FqTTdZY2pCVzFkZ2J4U2lVaTdGYXp6WXpwM21kWXVuS0MzNndxUlczalR1?=
 =?utf-8?B?YWUwL2dzTFFXUFcvRVk3ZTFneTNYdzJ6d1FUQXlGTDhLREp6U3B6ZkRxTVpz?=
 =?utf-8?B?UVdSb3BhQkltSWp0WllaOUdsV3dGTkdwTEY1RElMZHRhbS9iOUpQenVGR25j?=
 =?utf-8?B?c0FnWGRZV3RZWkJqc3ByRHo5bnd2NGhrWFhqZFI0cU1IVUlZbXJHNHU3cUY0?=
 =?utf-8?B?NnAzN3pEVW1ZWUhweW1hYnZWbk1LaDlrWkNzcHNGMDV5Rm1yTmJSaHdrSncz?=
 =?utf-8?B?b3F3TEFIRXFQbkRpaytFTXFrMk16TXNkUzZUNjJnVUp4S3JaL2RhTlg0elN6?=
 =?utf-8?B?Zmxjamtkam5nS0YwaUloQTUwcHphNG5rU0F1NHlLVGxjb3BXdjZIbkRRMHNB?=
 =?utf-8?B?L2VVVWJSWkNQQXd4YzRDR1FQckd1MUhmS1ZZbUs5aWw1YTRrUWw1OW8ySCtt?=
 =?utf-8?B?Q2gxUnZHOGtBOWtVZnVnQk5kR1NZZm9FWjhqTDZFalBFbTNjaDc1cnBoMGFY?=
 =?utf-8?B?NFZzSU1EWU1BQ0pvU1ZFSThmRUI3S1dKb0xyT3ZlbWJsQkF0UjV1SmhlNVBR?=
 =?utf-8?B?V2M3Z0hqMTFqOEl0Z1VHeGZvemNORERjUkVQVWNRMmZpWGVKUGhtMjBOazRp?=
 =?utf-8?B?eFNienAxRHBpSWU1V21SWUNZc2p6RXJXcVcyTXRJMDdRMXYzUmk1b0I2YjdL?=
 =?utf-8?B?ZzBpTlQ5NE5kSk9tWHRUbExZUTh0WGVqczdwN1YzQTkvV0ZlKzRNV2VRWEJW?=
 =?utf-8?B?SEJzbCtNdnpqeEI0dkJlQWt2V3l4MzNsQi9KeUpZS2N4NEFveWMwc1l5Y2Yy?=
 =?utf-8?B?UTJZMUJBZkMvMVJPQlNpQUpMVGNEamVGYVI2Z3VYWHNaWmVWRisvdmRlTFli?=
 =?utf-8?B?aVAzaGUzWlM3dEZwMTdHY3VQVUUxVnBOYkZwWHphZWh3ZlZMbHZNR2FjVGh3?=
 =?utf-8?B?T1ZGVzRLYnREdWJ4MFdqa3Uwb1c5amxzelE0UmFkMTNWaTJGMHRHQmQzMTNZ?=
 =?utf-8?B?QmpINWRvSnEraDNBT0FVSGpCK3FMVi8yUit0NHZ2OXJtYzRXRERjNE5EdXRq?=
 =?utf-8?B?TERoYnJnb01YT3BrUHFTdFE2UWc0M0xPSTRXb2JBZ055RGxOV2JucHRaOVE4?=
 =?utf-8?B?Ymgrd0NVMGVBbXF4aGQvYXhxeWU3YmpNR0llclFDUWhYc05RSXZwZmljSzNW?=
 =?utf-8?B?MlBDYlhhL2tFMlFvaGErY2wrOFp1cno0ZkZ1NEN6aFE5dVRlN3BsZE1FMjBl?=
 =?utf-8?B?cEk2U2ZzNjl3bGVQN0JaTndPVEZjTEo4a0ovWnpwa0IrZzBleXo1dHVybVMx?=
 =?utf-8?B?cFVBT1hpUjJ6d3FTWUVFY2x4N3JIRHE2Vk5BbWhXSFYxbFhQMjBhK3l4VVd0?=
 =?utf-8?B?UUtRM0JQY2VsQllYOXhuV1k3SExkbVNVZW5UVjZuNysyWEtmTkZvV3dZODMv?=
 =?utf-8?B?ekpxbWpEUTN0clNtbDk3bW9ZYlFlYldpVjc4d2xCSUFwUGdVQXFaMWorc3FC?=
 =?utf-8?B?cStycWNxMXZxcWMyTlJvZkJ6ajMzMGY3L2JrOGRTRm5DSHhMdm95cUlTR1Q3?=
 =?utf-8?B?YWZEZTdYZGFCcXVvM29LS3pTSEZ4NUdnL0pBVFJ0ODBQWVJSL0VzblZ0d0tC?=
 =?utf-8?B?d1E0LzArOGhPR2U0eGJnV3ZYVDVUUDVOaDRMVkUreHJQOGxiZkJ5K3hKcHpQ?=
 =?utf-8?B?TmxQRW5uRmRTemEwbkN0bDh6SjVqenFyMGdKMVM4amFuUEJHQWdpeE81cGc0?=
 =?utf-8?B?K0pTRHN6T3Rhb3NkaUNyRWJDM3NZZktFeW9SQ1d4WE1VSzJBOHRXd25SbzBm?=
 =?utf-8?B?NEhlcjRSdzhSNmg1anlxZGRzMVdaN2FhbHlFeTFzdUxuSGw0QUxtSmpDVkpu?=
 =?utf-8?B?ejF2allLNHRydnBKL25ISit1Z2t6a0RLVGNqeDVwT3pic1hoNUVBMlI5VEJD?=
 =?utf-8?B?OU11U0c4Ni9sNnEyWE11UEJkK1BCbTBwaDBzWGJGOGd1NGxFaTl6eDFJWmVI?=
 =?utf-8?B?SWUzK0JwMU9UZzQxWnpEVzU3U01relpkZXFoQm5ETFRjMzVyZ3diV0FyWGU2?=
 =?utf-8?B?eFhRUlpPblVXZk9TRm00LzZtdkVHa3J5cnJtNVFnaVR6TmYrWVMzM1U4anNO?=
 =?utf-8?Q?4FIA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1NRdzc0THBYMFhxT015ejNqdUxEdWhqa01EVnZEeXZNOTJFanBqTTh3L3F6?=
 =?utf-8?B?VUhXQ3ZrVXpSOFFiTnRMa1Fyd0JDZTM0MHZxTGNjYXU4Um1Fd3UwVzVMbkhK?=
 =?utf-8?B?UmFBRzFNUFpUb3lIRmFLRVhzcUdVVGRjVnJKUFUwRTRkL1dPeWx1ek9JL2pH?=
 =?utf-8?B?d285UkZ0dmpOcmNtRkJyOW5NVTRoYVRXTEMvZ3J5UXNDL1I4RGVMeElWelpn?=
 =?utf-8?B?SGVLUHQvMVVtbWxTakR2ZU5pdFFEamtTd3kxOXhLMFVZejNKeEdhTHFNWWRx?=
 =?utf-8?B?U2JFU292MkdITktiTFlaQ01pKzRkWEJ2MWhHQnNxNURHTjVQTkdvUXdNcTFP?=
 =?utf-8?B?SmVLNTl2cFdwRThBMFBOSGlFbGtQbDIrelV0cmxrTFhtakh5OVVBaVZ4YnE0?=
 =?utf-8?B?OThMaHdSUFNDRWZpZXAxUXRtTmtVNlRoS1E2QzYzeEM5VmpuMlFzZUtHVklq?=
 =?utf-8?B?TTFZMWFzNzNLd3hiSmQ5MWpWdUt4L2dXelhVMEZEOUhLZyt1NVp6cTlwT2dq?=
 =?utf-8?B?eFhVOWQ5dzVXeHZrbWlZbDBVTzZvMmJKMEtlMWZzM2lQTE1SSEd4U0w5MzRU?=
 =?utf-8?B?VEluNTlKci9PdVdBNW5ENlR1S3ZKdjArZHJ5dVp4UXJEWVNXZ2M0WWZIYTl1?=
 =?utf-8?B?dFZEOXN6eE1rU2pIaS9iKzVrZVQwazJ0cW05Ry9xaTJOQVZ5alA4b3hIQzZq?=
 =?utf-8?B?Y1VmRUNaN1hxc0tLY2V3dHJtSEFYcGRDZTY2RFVQcU5FcHA4QXQwV2xaRUhT?=
 =?utf-8?B?NGJvVzNLbGJiV0ZqSGFob3hjaWJPWnNkSk80MThpeFlqMFlVemkvWjhRajJK?=
 =?utf-8?B?OE9rY2M2VXdLcmQvNXZsVHV5ejV6SVJQdkRYZzRMSEE2TmVpZXJSWmtSeGVV?=
 =?utf-8?B?cDdmWFlpdEQrRDRZenNpNGRVcDBDQ3dVQU45WFRZRzdSMFpDZ05kK0JWR3JL?=
 =?utf-8?B?VEV1OWdFa1ZMLzlpOGFVOXdpa1lBTDhwVTVRQm9EWFBBRlhFSXFJRGVKWGZ4?=
 =?utf-8?B?akFVaEJIdzcycWZmS3F4M05NbC9aTlVRSitOQXczVGJ2NkpBeTBGQ01JTi93?=
 =?utf-8?B?RDJhaC9zcFVQVHBsUUlybFZEeThYZVBQV0JpVnN0UHdQeUxEUnlieUZXbnRK?=
 =?utf-8?B?UGJscmVoZE9BU2d6djlPTSs0TlFQakhiMmovN2VrM051V0x4RkpscFBNejc0?=
 =?utf-8?B?QXM1MmFsbUtoOW55Ukd2d0toMFkrUGVscTlSTjVCckgzK2dZS2poOGlESTZX?=
 =?utf-8?B?VXlvdFJiQ3pJQWE2elpNVUJET29QMDB1TmIzNHRjOXFuOEFwMDNoZFFMZjVB?=
 =?utf-8?B?STJzdFU2YjZaeGxncE1TZXN5VHdZYk0zZ1FaVmxQbXNrZk5vd0ducTF3bTdL?=
 =?utf-8?B?MDB2cVRMaHJXNU5CN1YzRGxFUUNsRGRTQVhCZDQxcFFWTG9VMHFUbm9JT2ZT?=
 =?utf-8?B?KzJHT3hLVVMzVmhlbEw4bnJXNEhaQXR0Z3VKQ1prN2dFb1VGUmNzblRKc29o?=
 =?utf-8?B?MWVLb0ZqaHZYVmlHS3drejVNQ1lVTzFkS29aZ1VWNndwaUFBNFd1cFd2SlM3?=
 =?utf-8?B?WEFsUG43dCtKNExUSVRlQzh5U2lDRU9pYzNxYUlITEtnM3VQRUJTWkYrM1JS?=
 =?utf-8?B?N1ZVY3ZER0dIK2JTTmg0MXc3a2tnZ3hFVEZ3NXdRVGhGS3VzNkNJNlI4N0Qr?=
 =?utf-8?B?b2Rua1NhSnJzbVIvVndUVkswRllLM3J5ZE45SzFrRWk4SEQ5dUVwaWlTcGpY?=
 =?utf-8?B?TlVxdXJHSjF2YTNJZXV3cktLNW1LSFcySzM5Rjk0cXFkMUFXdEdnUkxVeU0r?=
 =?utf-8?B?bVc5ODlhY1dHSlZIUXFjSGdqK0c2c21SRDZCVExBbmFkenRqdU9UT2tGTHdj?=
 =?utf-8?B?VEdxa3RyeW8xZjY0NXAvb255YTR3RHlPTzBBc3FoZWt5dXdiczRFMWFFYXJF?=
 =?utf-8?B?U1ZBdDhtWWJvL3JsQWRCc0FjK1ovVHFXbXorS091a3lXd2pYS3FwNWY2OGhK?=
 =?utf-8?B?dkFIOU9iZnRqZ1dVNFl0VWtLM09QV0l6ZllSRjNWWUJXYlhLNWVzNThYNVZs?=
 =?utf-8?B?bTQyakhnL0ZPZDJ5cFovSDdnd1lXMkxWcXRVbmEvT2FDZHJ1VjJsUUJQWVZr?=
 =?utf-8?B?UUpMNjJINFEydlY4TGJWcE1jOUc4WFI5OGU1QzJQNWpINW1jbTVlSStyeHVx?=
 =?utf-8?B?cjhkQXkrTTlFbDdqWkVWczZJUmRabkpGaTJJeW1OTHY4YVc5aWpVQlhhUHh5?=
 =?utf-8?B?SDM2cVVlNjBJbTFidHQvNjV0TjMyeVpFUDhjdS80QXJZUHZrUkdSSDV2VWhi?=
 =?utf-8?B?eUNUMzRxQnU0VXVJdEpmMkREUGlOUVRFdWxaK08zWE9TQW82TW5PYjRHTTBZ?=
 =?utf-8?Q?OWHULziXdXvuiGXtJ7d/1zslOsGP2EzItUwb2?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 970b1baa-b349-40ef-58b8-08de5e7250a8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 13:37:00.7230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kf0SLk8zkMPHf/6S1ZKnPbSiFiyLc+2cAo60nd0R3ykhXSElsf0aZPdPh7C+F7KgEMUHCIts71S7/zq/o5hHGI/oPCpWeZ4c8nXq7Lq9WN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10456
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 13:37:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8760

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Rename the source directory to project, as specified in its new
> definition in terms.rst.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

