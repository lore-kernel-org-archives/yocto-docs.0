Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A634C9EC7B
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 11:43:23 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31030.1768218196647246021
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 03:43:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZHIitPhZ;
 spf=pass (domain: cherry.de, ip: 40.107.130.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLrFYvBJggrhZrbNjbWnarDdZ182Rp+Nsa8lM6Vu329wgPcis/gvLDcYwsb63c18nq/3ayzGs74YqLyaaKIvIlqjR/PGZCyA0szbZWb21Xb428BPljBuLuXJlwQbkj2L856xKL873Ft/uwcbTyWhWOnkZAmA8xi89fmbSBlHT7ugVB57/gQI13Jrwz8GQSAHscINGyEeSXlv8RYP6/igFaOIfwqyMB/FYUiZR43jkG7xVsDX7Z5T7AYcL9I9Fn+83psJCQZ+xzMcETDrlROmEWM1TTAQSL9+rDH8YxiQFGEOUDLaZJcQq1e7oSev3Qpk+akkI1GxlTomd6rM0u8mHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5nZDlrraYswNeJFbtZMq5sebk/dsaMNgf3vKIvVzeE=;
 b=bayCIYZfBiEQahqQwy7q70/D5g4prXmKrR3tRqZ8lOD6nSh6vEDhsRkAIpdFFO8lEKlh0Hw4mrCm0xkpBSo9wL3SYhQ2QV2WV8IStSsp/vaAT8zkxLnfL21qrnO8IbJ5092Fm7wNhGklZzU658Qhyhs9u4RAfUntBHrCkNELwAWPnOyN7eLM+3iFFgO6DWyeKG1wMIu3Xv0Sr+UZKiXryoR8Zy0p5O2gyT1LPxi+d15uH7DhYnuH1hhi/UtAnkjNyVidJWnONSnLz+1y/Ajo66vOQ4qDPl5XZuSxpwMSfJLUJTUS5BIRjoadn+XrqdkM/uU3LzJ/t16u2VZxsLGJ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5nZDlrraYswNeJFbtZMq5sebk/dsaMNgf3vKIvVzeE=;
 b=ZHIitPhZt/UeO2ma/iJ3g9MJCt0yQuJFgcPN+dOoctxanZHAkQDw5AlA/CwutV45g0Zq5wIDZbiO21XY6iQVJQKYIMftOkD6SNwD0GS4qrfk9/c/YeHADuUEClBVWfd7AYUonhUtXhm76+RqRweKQZlHnKRt2jwcfjfd1wM2ZoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB12011.eurprd04.prod.outlook.com (2603:10a6:10:63e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 11:43:11 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 11:43:11 +0000
Message-ID: <33328dd8-1f22-4f4d-8c0e-ec55715c426b@cherry.de>
Date: Mon, 12 Jan 2026 12:43:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] tools/build-docs-container: allow running
 non-interactively
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
 <20251222-concurrent-safety-v1-6-e3d86e44cd38@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251222-concurrent-safety-v1-6-e3d86e44cd38@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB12011:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f16dd74-1fb6-45bd-9c9b-08de51cfc38d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L09kRS9qTmJhTUNxM1Zub285cEdOSm1EMk5BcVgrTkx6SnVxV3hUbzdxR1Z5?=
 =?utf-8?B?YWd2Z2NSbDlhU1hOZ3hLUllwK29DMmE4K0YveXNKRDRidXgvdG4zY0prRVFh?=
 =?utf-8?B?aGt2V0NXWExGUnRBVE02MFZsQ2ZGcXlEdW5VSFRMV2g0MzVZRitDUXppMTdt?=
 =?utf-8?B?Y1hOWWpTbGRNSFcvRVZvL3BBTGxxc241RWZKKy9xallHR2ZoOG1obXRUNGFJ?=
 =?utf-8?B?eTh6T0l2SDNaU2hScW5HVXJhSnArbU8reUZmKy84UE9GbFZYMjZXNWxPOUR4?=
 =?utf-8?B?SWMvZDZtRW1ZTUVLOEp6SDE0NTl5cEsyUDFBZlNlbWUyYWh6eDFpRy9DUWg2?=
 =?utf-8?B?WU9WNE5TdDlBTWJQd0lJZ29ReFdpR2lRbWtlNkljVlgxTEVFcVpMNk5hTGll?=
 =?utf-8?B?YllWUVZpZytzNTdjQ2dvS2FlQ1dScUd1QUVOUGRTMDN2L3BXeklQLzdCWm9T?=
 =?utf-8?B?UEpnbVpqMlFsNElSOFZ3cEFFTXJPN1dnNTVlVm5QcnBZNlhYeStvcW9VV3BP?=
 =?utf-8?B?YnVSUTJUUG5PTEZRZ0RBU3p1SGREbS9mWUwwYUcvNkV1WHIySDcwMlZaRXB1?=
 =?utf-8?B?eEdzWmRvV0FnaG9mZjRyVG93bk5DR1R0OHhkQWduWGdEdzhvd083M0JydmF6?=
 =?utf-8?B?dVRxa0ExWHpHNE85M1pmQUkxWCtGSEFXN0NxM1FtSWxiOEdQZE5XcDVPS2RQ?=
 =?utf-8?B?emRPQTZhT0NRdlhtUzgxYVdPaUE3SWN3RnRjOGY3OUoxUkNIQnJ4S204UmdR?=
 =?utf-8?B?UjgvOWR6cjFETlYzUmx5QjdZdHBuQTJMQmpUZW1uYTA0QW5jSXY2VWU2aUlm?=
 =?utf-8?B?S2padEpNdCs1L3lTRjkrd0VXZ1gzekFVTHBZeXJ2dHEzQVhDZG1FVHg1Mnll?=
 =?utf-8?B?aUNWUEhJTlI4aUowOEphVnVOdk5kcFY0dUFLa1hXY1hucXFMciswOXk5L3dI?=
 =?utf-8?B?RzhRdmtkRzRXZkM0ZGE0TUg2RVNLeGtFek9pYWJCOTQ3RGRySDNiWDNiNmpo?=
 =?utf-8?B?Rm81aWRxaTlnMkp3NEx5bm0rV2hOU1ZDNWdLRzRSZkFZNXFIcTFRbCt6ODhz?=
 =?utf-8?B?bk9aVkhvTHlkZFJ6VEdKVkdCZ1JjOUFYcDVGODRQTlNGTTYrUWw5YUFmaVVy?=
 =?utf-8?B?VC9hdHlKMTlnSERjbXNmTy9HZ2pFZCthM3Vqbk5xVGhiU3R2VjFLN2pSVDVK?=
 =?utf-8?B?cW1pcnVITUZHQjJXZ09LZ1lad091dUlFZ3ZlcU1QSnVFMWM0S2RReWZwRW0z?=
 =?utf-8?B?RFIxeXJRcDJCbGtWZGttdmdmWE9za1M2dDNzRFp0MHBFd2dLNk9DdlVkazRM?=
 =?utf-8?B?VUxLRG0xTFRRVFd3d1dBanE2STBLcjVMeklzaW9rcE5hT0JYM1BVOVhSQkov?=
 =?utf-8?B?cmoyTGsrNnFxSjdxNEtnaTh4MjdSbEUwSlBvZVpFMU9XT0hnc2J6WjFMeHFj?=
 =?utf-8?B?T3pSN1VkSTN2ZlRNSkFkQzVkSVNpWHovN1p6RTFGOEJIS3FTZHhSSVpheUty?=
 =?utf-8?B?V1o3OEE1a1dBVzhOOTQ3Yy9PTWdkMkZoNFlCOVp0c0dlMUNUbktzWVhveFhP?=
 =?utf-8?B?VjRELzZHUDBhOUFZNmlOU3dMdDgzNnhnMlRROEp6WUk5UnNKM2czQnRaRHF4?=
 =?utf-8?B?QnFrdjczU1FPYVRqTUJZWmRQL3JxY3VtSnE2SHFseDM3SVBFcVlVbWh4dldL?=
 =?utf-8?B?ZENWbWZsakpVY1VaYXJjYXJZcjVrSnlaNkxMRTlGb29lNGpxdHJoS1ZrUllq?=
 =?utf-8?B?d3psYkFCeVhiRjZ1elJTVUFqcjVRS3htMnR6emo3SWRUcGJkRjA2Wjhib05x?=
 =?utf-8?B?Vzc4Vks0YVRidGlpMnUzbXdhb3AydkJzVXpMVVVmQlJTYVBtUlBSMkQrQ0hD?=
 =?utf-8?B?WSs5bWhWdzNUSmppeHhJcVllckE1d0dpdmtxYlk4clA5djRzZ0N1QndUZWVP?=
 =?utf-8?Q?EOmKAiM5MLchMnp4yrDysIl+/7mBVx0K?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UjkySnJuOG54TFBnbjE5VWVJU1FBOTZVSnpLQ3pxelhsRWdzcHNXL2NPdWRK?=
 =?utf-8?B?VlZLeFdSL0JuZ281aEx5NmhTaXZOQ0U4SGdNYXdZMDdybWxFbEZlYmRaVndP?=
 =?utf-8?B?dWErRzVzZDZHTVV1eGJNRjRrY3M5bEsvNzEwdzNSSStnZFZSTmR6RFVFb0xk?=
 =?utf-8?B?SHJKdlZSbXNqMTNFQ3dPN1JEMmk0aDNTTFZTMG53RVJ2QVhDZno4MitsT3c1?=
 =?utf-8?B?eTdzV0VRSDJ1UnRSOUNDQUJFNm5HWE85Sk1VTi9ZNTB1aTJBMndzRWFnZHRH?=
 =?utf-8?B?U2hqL3A5WnJSOHdqZWNvZXNNUmhHRVlpM2FsU0ljMTVTTzQ4ZmFXdW56YjBy?=
 =?utf-8?B?QlhZMDJURnpLTzJ1RWVPZEFUSjhKUmtWVzNNcDhPZjNQNmlhNXVKWUQxVWln?=
 =?utf-8?B?U1NVaFUrSWV4ZWVuUDBSZHVHMkQyL1VjSEZzVk9nUE1aQW4vaEx0ZUg0SDZY?=
 =?utf-8?B?VDN4Q3FiK3dNSUFvUlJPc1U4V1BQV205MitmMkptYzZ0dHI4YklhUjJKaVdR?=
 =?utf-8?B?Y2ZIZ0o4UzlVN2N4eS8rUVZiQ2lObEtGRXZ1cTNlbWI2OWUwRHMya1dVZ3Zj?=
 =?utf-8?B?WHV2QjlFSmpPTnVwQSs3czlTczcrZ3F0c0xxUHd6NktVZ1FZUEJocVFscFdp?=
 =?utf-8?B?UmVEN0VQMWlKRFRYZjE4dGNMWE9IMzlQSzVLSTR2dmVIOUlPYkt5YitrMDRx?=
 =?utf-8?B?N25CRXBzbFZHSVNYWUZOYS8zQUJXeUFLWGE3V0RHclI3SFA2UVlKUUVBMGh0?=
 =?utf-8?B?TFZlOGl5d2ZVWjdzYUs1cUs1Q1dVOFdVUHB6alFrSUxrZW1KaXlsbmk0UnJt?=
 =?utf-8?B?QWNuZjhBMnNXcTZMTWJKMVlEVnN3NWZKVXRJNFlQQXZVZG9Ob1kzRW9YUDg3?=
 =?utf-8?B?UkZqUUxvY3dlOHJEVGFSQ2tkWnVlMFh4Z1p5Yzl2QXlrWElnc0JMWExEeElC?=
 =?utf-8?B?NTltSmFGcGlaTHpRaStiQzdpTGp4Nk1DME5Gbk1UQ0M2UG5tSHZVaWFVQi9p?=
 =?utf-8?B?UkIrMVgyNEh2QmdnT0JJaVJBOEh0dTdVZUpSUHZCZ2ZENW1nUU5Ea2hFVzdD?=
 =?utf-8?B?Q0c0VTVoTThCZGpuZGI5QVFwMVBuL1pxK3A4YUphVUk1dURkM0xzWG5LN0NQ?=
 =?utf-8?B?NGlwazNlK21iRTVCeEFPTUZsemdhZGQ1ellIeXFaSlJtMkxWZ0pLU3R3K1hr?=
 =?utf-8?B?RHk4dG9sWUpTcWFyMzhzYzhKQXpUdFZZMXFyaW9VdDVOVWVhb1g5NmRDdzhx?=
 =?utf-8?B?aDFjbXdPRnhiTWROc1ZXb3N3dzgxNTljc0VOUHFrQjVqcWxNejQrZzFFUk44?=
 =?utf-8?B?N2txQmdtdkt6dXd5VGZ6eTlDLzZnK2pKM21reEQ5RW1qZkc0ek0zVmw2WmtN?=
 =?utf-8?B?ZEdLYnN1SlllYk52ekxCYjNwK28zZnNGb0VtdTFxNlNLZzkrYnAyaEdSbnRL?=
 =?utf-8?B?Vjdnd3FyM3c5NituNTV3dnBIQkVWVmRDL0h4emtGUTJEMGlrSjl6R3lWZmp2?=
 =?utf-8?B?elNUSzdEcHZOR0JHb0dHUDJ6TEhGd002ZzdHYUxQNFZ1eXpNS05xYUlWSDhK?=
 =?utf-8?B?OXc0Tm9OQ1RYUTdCRTBwMlVTa3RqcHl0d0orcGNxMXNqVlQ5ZWlMTC8zVStJ?=
 =?utf-8?B?RnpkUjlqWFJFV0hzZ1lOTUtUV1ZwQlV6Y3VsSkh0VjlvcUpUaklhdno4YlE0?=
 =?utf-8?B?TWhXc1g1cFplTkpac285dDh3ZmZCZFBKUnpndzBUNnY2Z3lxL0lxMTBxcnM4?=
 =?utf-8?B?cGRyTnYyN2dJWU83RWZkTk9GaFp3ODZrajJRY3B3MDFoS3gxZkcwTXhTZjBa?=
 =?utf-8?B?V0prbXptVnlpMXpCaVpuMnFyTVk3bjJJV3IvZVYwblJxVEFKYy80bElrM1J1?=
 =?utf-8?B?NysrNHp6LzdkUURBRUlJQlFYUjVWbGNtLzdUSjV4dm94VHF0bTFVRFF5bkpk?=
 =?utf-8?B?TFQra2RvK0t5MkRpVU1teDJsK3FwWkx0OWloWmJBRVdTSVRBYVhWMVJ6Q0lx?=
 =?utf-8?B?cGMzRnhONFlHMEF3dmdYaXEzVlZ2MVVkb21KeFp6YXQ2QUtZUk9zeFBhdFJ4?=
 =?utf-8?B?cXV3RG1GUlZ4bTZWalpOMzA0ZklrLzgrQXJzNEh0SlZpM2ptcVU0Z0hoc3FB?=
 =?utf-8?B?bEYzTFBIK2VGRDV3dlJaY1ZxT3phWHM0MGJZNmIySlJXTXdxdFQvU2t2TkM2?=
 =?utf-8?B?OXNrRVZYL05RQ2RQT2ZDU1FPVjFGR3R3UThjWk5wVVlhNlNCOHh1dmd2cjBp?=
 =?utf-8?B?SHFPcUFabmN6TEdydHJxbkx4bGNmcHI3Wm5DRHlSdWlacVVGd2xXQk5aN0Yy?=
 =?utf-8?B?dER1WGJVRXlmRnpFZE5RNFpXNkhqaTRaZ2RUT1FmZEpla1VqR25ZQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f16dd74-1fb6-45bd-9c9b-08de51cfc38d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 11:43:11.5942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6k+EHH/4SxsXd61re0iuvGDRNBpq0RuRu89RG5TXo4ADgo30hRczCe4wAmafQW4H566iT5nOedJHejc5J97nCq+f71ZIWO5SxftlEP9ejw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12011
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Jan 2026 11:43:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8454

Hi Antonin,

On 12/22/25 1:27 PM, Antonin Godard wrote:
> When running this script from another one, it can be useful to run the
> OCI run command non-interactively, especially when running concurrent
> builds. Add a RUN_NON_INTERACIVE env variable that can be set to 1 to
> remove the --interactive and --tty options from the run command.
> 

I don't understand the use-case? Can you provide one?

Also, if you run without -it, do we need to pass other flags inside the 
container? e.g. DEBIAN_FRONTEND=noninteractive for apt-get (I think 
iperf3 prompts the user when installing on debian, so that could be used 
to test).

Cheers,
Quentin

