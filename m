Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA92C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 09:50:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.136])
 by mx.groups.io with SMTP id smtpd.web10.168193.1719309034556535652
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Jun 2024 02:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=J1FFpEjO;
 spf=pass (domain: cherry.de, ip: 40.107.20.136, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSEEbT86OFa3tGUcBqbrMunamK5laUxuZ2088bgeFpld19SXphaQjQEVmnecXZLR5CT22CPpdXQNb/594HU7rqM/Y5xYJI/5VHGiJ9vS0eq7bhxFZRJH+RO04mLQnPrG28YWdddCIXThITS9rX/938EAYA3qRSiNPEybHzxQ+DTkgVabRB/uPaKWZJy02URMaX6ObySe+FwEpO22aSFpsUFpFN5DgH9yo6aR0Mdmvs7lExey8xLu9ZmulDzpoOEryuIkZsxgqYWSBh2U6WxDjbMucMjbOomrI4UxIGdacETOqncSjV+SAQuaePaSE9cdzm0NzZK0hcWibTr3sPFoiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6Y0fbXEYc0MwKSTWPSfHcrvYoCDLnx/3c1VfIbt4Fo=;
 b=leu083pGW6wJsFti9uiyC4nACYz38N1ZVHMZRF+LeQfqL6vWb6Dd5FvRFJuHZZkw1kwlL1QWhYO8q1IGeN4nmm0DoHeDoBAaq7qUufxw0MKlGx9tzR4ximjVtrzwrGjagKn6ovcCcnTYozkQctzoltGDm5+Wpf8GZT9oWE14B3/kRazaduqqDvir6WKz4zKYGJRaeLCkij4JLQoTGlLgcy3xLav9brYUsMtuUX6E8zajAbfsZQDkcD6kmt1ZzHrkJEh7dF10Lh5JCuy/Px7XLnC2aiwBU2Pmx83WnHXYWTlRhq5wdHE8UTfYOLnmto2smt+znF/vGt/l4W8s9GxBbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6Y0fbXEYc0MwKSTWPSfHcrvYoCDLnx/3c1VfIbt4Fo=;
 b=J1FFpEjO+2VgLPnRyxxE0uVD10Ey5EuOCQJORIer2u6sTmly1aQJR8y7p0R8pCOWHjqMigJF7JMX6Ha2rqzbYds6Yn0o0B3liWazFTcza86Q8Bgw3pkCatW4jn2En7ijjK256sZ83ml1FBrSYDHv1M3R0I2/FoyFmruWTRL1GyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by DB9PR04MB9425.eurprd04.prod.outlook.com (2603:10a6:10:36b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Tue, 25 Jun
 2024 09:50:29 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 09:50:29 +0000
Message-ID: <f90aa264-4346-43cf-a236-927a1dea94b3@cherry.de>
Date: Tue, 25 Jun 2024 11:50:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] docs: modify reference from python2.py to
 python.py
To: jdmason@kudzu.us, docs@lists.yoctoproject.org
References: <20240624221238.424162-1-jdmason@kudzu.us>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240624221238.424162-1-jdmason@kudzu.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0040.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::24) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|DB9PR04MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 762c0658-ff2b-4880-3122-08dc94fc3ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RXNITmprdGd6emdPOVZZaUpmRjRneDdQVnB3M2dxUElLbjVqS293VHFHMEdS?=
 =?utf-8?B?ZGs3eVVIVHNmMmcxWTRlemFrRWlMOStncS9pWklGck5aQTBad2pvVzcvV2pi?=
 =?utf-8?B?allMTEozUXFGWWtxcXlKOHB0aTBQbUhDaFFFU3ptS3RHMWFsSUhHTnpkWjNN?=
 =?utf-8?B?bjNoWlFsbFN2TVdtNzFLTmQ4RkMyaTJSRnVLWXliS2JIOFJVMnBUT0VqWWdk?=
 =?utf-8?B?UW85NGlwclJsVFpKREJvNnpRaU1HVjQ2QWF5ckUwekc2ZXBMY1Q0bzhZbytq?=
 =?utf-8?B?RnBTOFlnbytXemoxb1dWcGVpQXpNN0haUWw4TmFNbE1PeEJEeW9oYTFNSG1x?=
 =?utf-8?B?MWlKU2Rlc2tjUFZPRGE3QytmS2s3Q0NWZzVSbmJWcWloVGlTTzNDQnlQMmNz?=
 =?utf-8?B?d0QyZmYwb0FOQU4wd05VR0JHeVYwT2FpQ2ZucWdDM0hWZElJSXhWUEZPNG9E?=
 =?utf-8?B?T0tXNUpiRGJuaG5WUC9TWEdtTit4dUdrd2V2c2JyV1lPUmlvQjlpRkRPZUhi?=
 =?utf-8?B?RkU4RS9ObU9zOXgreVNtSTZuSTVHSHN2a3dmYjB4a0Rac0M3ditYWHdKeWln?=
 =?utf-8?B?d0IwblV0WWV6VTMrcE5uS25BcGNLeTUrNGVZWHpoMUFVRy9BTmkzNVRTaThs?=
 =?utf-8?B?MEMzU09ZL1lsVjJERlhmRW5JSEwxZHhzcEFoczNGUEgxaENaM0YxRDdveCs3?=
 =?utf-8?B?MlBKZVlPeGZ2WGowOXA0dnFnVUdaNGVwbDloaGNXa25ZM2NXeDJpb1c0cmpz?=
 =?utf-8?B?Y3V3akxzWmZPdTRMRmFmdWRUckRoZlVwWE04SEFoR0dhWDNqd010UTdjcXcr?=
 =?utf-8?B?YVBvc09QdU1MWXUzMkpVbzRoT0c4MzZOcG8yUWdTMThhMzNnYkhpeXExenM2?=
 =?utf-8?B?WXdubWdWM1hPZ3VHdHorVUNWaFNzbENLWTJVU29PVGFmcGdEUXgyOXRFdm9J?=
 =?utf-8?B?NU5VYmVZVXBxaWRTVHppMVJnTWhYSWVQa2JoMVB2VmRxcVY3a0xKRWdTSzN5?=
 =?utf-8?B?c2NSR2RERFY5VWRxcjdjeXZZRmxjNjNtckpGYmMrczVtd05JZlE0eHMvVHJJ?=
 =?utf-8?B?RkZGajBkUS9VamxRaWtRLzNUYmpJK1JxMmJ0TDNGZ2hBZjdlUGlvUXNrRFdi?=
 =?utf-8?B?Um0zYnhOc3FMaWJCSDdBK0FHbkl4N3RKdjBlUzliU3l5UjNydUltaUl1ZGxH?=
 =?utf-8?B?OGIyaUhJeDVQeXdBa0dvUTNhYmtwSWFyQ0NCWUhXMEdibGQ2R2RxMmZiMVRj?=
 =?utf-8?B?WlluOUludVhreVhSeEVHZXpOSGl1em4vaVVjN0ppNitML21DVlJZZzREeFQx?=
 =?utf-8?B?VHpPVEJnVmU0M3VSdVliblZPdVFuZzNDVnlqS1BIWURxTjhmVTcyS1lVekJa?=
 =?utf-8?B?N05yM1NGUVgzaXZ6MFpWZjgyazIza0xIMTFTRkxURUF1NGttemtwMXNibDZn?=
 =?utf-8?B?RUdYckswZ3ZYblVHK3o2b0RZQVY4bWJIM2JrdnIwVE9YV0RYTXhQN0pxUTQz?=
 =?utf-8?B?SFYxU1VkbkpqTUIxZEIwQmZoZDhvNEg3bkhYYjArMThmNzBlUHZJN0JnYW1D?=
 =?utf-8?B?VkF4cUg4K3djOU5vYXYzZW1ST2lkUUNNenBzdUFySHh1SS81Y3BXa1UxWWlH?=
 =?utf-8?B?YTlHdWRObDhvWTdENnpNUEFmZ2tpdktKcHBpRVRKdVJwNzc0U2UxaXNrU2lo?=
 =?utf-8?B?eGlqQTBSKzNtdzJvc3RBczI2Yk5zMURMTXN2OFhLOVpDQll5YnNIMStoMTJu?=
 =?utf-8?Q?dInmF0HW8WYotxeCrQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STM2cHRPU2M5VUFBUDA2N2pmczE3R1B1c3JQK3hMTjNvV3UrL1hNeE00VHgr?=
 =?utf-8?B?MjFIOHlMMUorempVSVE1M1pIc3doRXZNRDFFaCtLdzhSRjdSblB3Sm5PVTlq?=
 =?utf-8?B?b3JSeGoxdzFwZXZqdGZRMjlscHdPcVNOeUI0bGJyWU5qSmNhdXRKOXlJdTly?=
 =?utf-8?B?ZFVMTTRtMm9RcUJ6NFNPTGtZQ3hLaWlPcnhXM1JuK1QySmxnMldZSWpIcnEz?=
 =?utf-8?B?Q3o5YUVGS3JGd01DUkFBdEs3UjJTMXBYV0JtbnhvbnNPaGNUMXlJUWJkcFdq?=
 =?utf-8?B?V09xNjgzaWpVS25CTEZja0J1bTlTaHBUSlM4Wk0xRjVhaWhJU0tOdEtJeHZP?=
 =?utf-8?B?dG9ibDJWWTNLK3hpUnVoSWZMV01ZUDMvWGY2MFJYVzlSWkFDNHRQZ3RubGJu?=
 =?utf-8?B?TTZDZlJHRzdqQTVSaTVnUmt2N05KZCtSMXVQbXBIRklhVjlPeXVTTlpQV1Ez?=
 =?utf-8?B?T2VITE8xMU5wVTdhNHdyb3VjYVJ2REVyb0NTQStIaXk2L05JMUZPeHBWWE11?=
 =?utf-8?B?NVZLSVVaNmdMcHM3ZXVaK0pRK1ZXMUpZZGoxNEU2ZlJWelJGc3FpT2c0SzRT?=
 =?utf-8?B?Z1UwWXY4bWhIS2tYRzdzZjZNV1R0YXBacVVJd09ZNkxzN1NHeldqTzNGdVBD?=
 =?utf-8?B?NytuZFl5VWhOT3BVa2FvQ2VlOVJ0YitZb0MvU212MzFReXgrWnlhTFNOWmxD?=
 =?utf-8?B?QzhOemVBeU5DS2xjUTcxYnlDSTd6eVBqQit5WW9MaVRnMlBESEhyYjJLRFEy?=
 =?utf-8?B?Y0xUeGtYb3BCMlZLcXVXb1Y2UFNreVFmU3lLaEZmSU12VWgyaVdTUjQwK3l2?=
 =?utf-8?B?QmVaOHc2N0FDdGFtdU1ibkRleUE4OHplZVlsYkxxSnFSRmd2OWJDWENRUTFJ?=
 =?utf-8?B?Q0RyQ1ZzaDRxYkVaYjVVVldVcUl4TDJ5eFFRdHhkSW40WWE5dXc4SFJXRjJH?=
 =?utf-8?B?ZTB0SDhqZWpVcjJPY1dGYXRqSnByZmRKR2Z6K2hkNUJBMk1XbXVkcHJhZDZW?=
 =?utf-8?B?aHBDR21FUFEzL0N3aG1BTDJQdDRBem0rd0pEY2ltYytlN3NHekp6SjRGQ0VL?=
 =?utf-8?B?WERvK0RGT1E1UlZuSXRVcUt2d2d1d1o2dndHbWloSTUya0xvRk4rVXJMcHZz?=
 =?utf-8?B?Y2RyaDhVWTR0eUR0dzdWc2FETkZlMzhXay80akxsaHAxZGdTai9YMjhyVk10?=
 =?utf-8?B?K0M1ZnA1bU85My9ud0Z5UWpCcUpsdU85NW9SQm9iWlFRTTc5TXQ4c0t1NWRE?=
 =?utf-8?B?Y0c1emNRaytJdGZzaUVTdllydSs1YkhaaitrSVc0VXJUSDA4OGZjckNyL21z?=
 =?utf-8?B?YWY3K293V1pRZjRKQytEMzFBMksvenlsK3Z0NUY2Z1B5UkM0bEZUV0tOYndz?=
 =?utf-8?B?emRDb01sVzBsZHh4N2krNUNqZU94a2dqVG4rb2ZyalRNQzlNQVpwNW5jRGtL?=
 =?utf-8?B?aXBOdTdmYWJGQXc5UDRkWVNHSGFScEFidDlyc3hJRTdRcUpJblAwYWl1RnJT?=
 =?utf-8?B?bVhJazh2V0xzQmVxKytudVJrVHdHeXNhK2R0RVpuMlpTWk96VkdWNXBGRWlC?=
 =?utf-8?B?blQ5dG5xR254N3VqNFVQYVk2WkljeEFWMysvZG9EMXozOXoyallyZmM4YXFm?=
 =?utf-8?B?cWVVUEx6Z2p0RmNNdGxlTjhxY2kySWN6b3lONzZaejlIbXIxQWI2bTNnQmlm?=
 =?utf-8?B?Ly9jZFNMSnFDNGxXeUVFb3NIVmk5N1pRNHNnTkZRYXM0ZmpXQUw0VndIemNh?=
 =?utf-8?B?bjNxRXpYemxBcEh0UWFhcjdZaWhQQnoyMHpZUFhUSUV5QkdaTW1uOUp5aURL?=
 =?utf-8?B?RGF4TnJUSDQrMEhrVE9qQzc0a2ZqRzc5MGExK2dNd2dBNWFRMXBaa1hCT0Zk?=
 =?utf-8?B?UDRJQ2p3azQ3dkY5OVNkaUhzalpEM2p2MCsyTisxSC9ER0xwS2VhOU01bmh0?=
 =?utf-8?B?UFZmSk5Ka0xKaHNKY3I4bmFxSDMxSVhpaDdKQm52OVdaRVJObkgzOTZiY2pT?=
 =?utf-8?B?NGJrQzdsT1lndFBVSnNuTERlQXJJbWwyVUdsYTZvRUxqN3d1WndqNHhMazBS?=
 =?utf-8?B?TzdHQlk2ZjlIUlFNWGdUb3NURFIyd1llMHE3VE9CTzh4OEJzSys5M3o3NjR3?=
 =?utf-8?B?OE9EaUovRDlVWTY1aVFDN0xQSHZEeHNsUGN0Z0ZUaTRIdEZCcWozQVlJK1dZ?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 762c0658-ff2b-4880-3122-08dc94fc3ef8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 09:50:29.0895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KBef38PCAcTaDpAtLekMD52pAQ33/jMUhasO9ADI/8zSvF6QK5JHKYTe0LaNu1vCPdOYyl3MiMBLCFHfQndchJQlsxtZD9IT5wm5yjZNLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9425
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Jun 2024 09:50:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5302

Hi Jon,

On 6/25/24 12:12 AM, Jon Mason via lists.yoctoproject.org wrote:
> python2.py referenced does not exist.  Change the reference to the
> existing python.py oeqa file.
> 

Indeed, and it seems it never existed in the first place so that would 
be a candidate for backporting as well.

> Signed-off-by: Jon Mason <jdmason@kudzu.us>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks,
Quentin

