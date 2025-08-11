Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3C7C87FDB
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 13:20:46 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.56])
 by mx.groups.io with SMTP id smtpd.web11.47518.1754918440452717569
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Aug 2025 06:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=cdu2EKAy;
 spf=pass (domain: cherry.de, ip: 40.107.159.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DL1PM5FXqIQ4SonJgb1DJCxPEdi0JqnG7oNix1Yp3zo9MxQjhyWaR8Z50WFDL5XtM5Ud95nV8EJCl2K9KYMfqbBbGehPGh9t21k4a5xF0BagoGoJJUm0aRjEgPzIWlPZgSVu13ulUENGCrnOXYvcSInrQ+0muYvIB65578m+wEs/pV//hhb7wu47HrQiuTK2jA3dkz3sbc8QuUqV7U/feuv53oCzYRBakTUU8zhFqMS5APF9mITKx9X2dYzIEg3xbtr0cPwXnf8kef8jFn+sYlj8V9ZBSV9+qP4nynMBPubMpTomPsHdRA56HkuGFSnJzpRMLB5g1MVb10rlWhkfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywm/48auma6Rh9liVC1aSTQMS/c/B9A2OaY87Ri9DYY=;
 b=DHp7y+FjtbbedyWhTc1tB/A3rVwC18W6xReag4A5cXzCODV80a+O79hQyZcEDLGBxGj0u2rzcxPg0bgj8fLGchKhJdsZGNNdUY5CpxtbpOMe48OO/9ZWLtCeXLBINNLUe9nzAXvyvHgKGc2IGdUdtBaHFqmCUZdB0PcWtgMTwuqR2xxF3oCYAb4BarREpR1Vcql5LfdQo7ZQGgOU0jhwb5u274TnimeA7cffHFNPy6lvVmEh8NACn+vlwzL7xFR/37NsP1BYv5Be3Lg0JWCAmdeaVnOz3CSN57Zjmu+2F88K3K6ogHd5GA3rM6KAQLh4b/48imdS0XHwEjdM9IabpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywm/48auma6Rh9liVC1aSTQMS/c/B9A2OaY87Ri9DYY=;
 b=cdu2EKAyCkC4H/VkzfsaS4L108WQZT0XazY0SemDA7KRngOq7QmU2M7CwtRZkCkQhlP0rUcpC3f/ykler0tCUKmVqYHmfPUUX/CeQsIMnD4IgVS18ObmPEIMJC+tvLhxLSG+2V+1/5fXg42fIeVZlNgKQxd1W8hEUZQhS8ZnSoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8882.eurprd04.prod.outlook.com (2603:10a6:20b:42d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.9; Mon, 11 Aug
 2025 13:20:36 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.9031.011; Mon, 11 Aug 2025
 13:20:36 +0000
Message-ID: <7cb5573e-3d3c-42c8-adbf-c66fc1399f94@cherry.de>
Date: Mon, 11 Aug 2025 15:20:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] overview-manual/yp-intro.rst: fix broken link to
 article
To: erik@awto.se, docs@lists.yoctoproject.org
References: <20250806123528.44117-1-erik@awto.se>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250806123528.44117-1-erik@awto.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0432.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d74bea8-addb-451d-52ab-08ddd8d9db12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YzExbCtFb0t2VVZyb3plOC9ObTA2OUpMdVBwM0RHTWczVFZDNHB6L01waTAx?=
 =?utf-8?B?bjlNTnhxcWhlamhoRW1iak9BN3h4MzF2dzhkc1h0TmtTd3pjM3JKeG1XRXFT?=
 =?utf-8?B?RGdDbWlDdDRpZ0VZS2E3QmY4ZGk3NzRDMG1USHppWE0rRnR5UCtKcnlUWXNB?=
 =?utf-8?B?bkdCWEw0Sy8xcjJDMDY1K1JPWmlzY2JkUjRhTkJ4YWwvVjQxbndJd0swalZR?=
 =?utf-8?B?K3hVKzA4TjVEVTVrdlkvUkFyTHBpK0Y4d0NnaDlqaGZSMjNqbytMdnlMNlVH?=
 =?utf-8?B?NnBKYWU3anJmN01XWEhaVDU5N0ZqMXRNNFlGNEdxcmUyc2RPNi9aZkpVSm9D?=
 =?utf-8?B?clhvK3FYUnkvSkJqMG9uRmQzdCtGKy9mYnM5Um5YT2xWT3pxdkpRMUZMckNR?=
 =?utf-8?B?QnIzTXZiSm1YUWZrOTJTV0hoc3BpbFR6b3BVcHhYSFFqM1ZuTUZrMDB2SEJK?=
 =?utf-8?B?b1hPb1RHc25jcGdPdGZQbGRsZDdrNmxTenB4dGZHdVZKWkpoekdTOFVHOE9O?=
 =?utf-8?B?QjZWYjA5UThuNkhGZWdCODNkemdNb2Z0ckNuc21saDJxb2gxWFp5QUkvR3My?=
 =?utf-8?B?MS8rc0RVb1dRcXFMcG51U3VyKzlhU1c2MjRvSys1QVF2enJrYkg1Z01EdnVu?=
 =?utf-8?B?SXQ4LzE5VnBEazh2Zm5XOXhIR2lwbXNpUWYzZ0RsVklRdGhDRk1GNzNlb2N2?=
 =?utf-8?B?VXIrWXI3OTVpdWxNVlVOdUZKbGp1WDlZZGFsOTdTTWdJTHNQZUhKLzZVZVY4?=
 =?utf-8?B?dC9rOWJJMFprTGx3WmZDME1oZEJ4aW9FWXliQi9ET2dTdnRZODdFaVNiL2FH?=
 =?utf-8?B?L1dja05xTTdKYUE2aEp0ODAwQmF1UHgweWJoT2RrMGN5b2E5RnV3WThWMk5G?=
 =?utf-8?B?OHI1TWVmT01GZFRCOG9KeXlNSXBNNGRoWjAzUE1SVUp1Yjc0SVp1M001cWNz?=
 =?utf-8?B?ZGNHTXNUTzFNeGN5ckRqclVablh5MXUrM3lwT2NuZXVkTDZhZFVaajhGcFhp?=
 =?utf-8?B?aVdycXJsSVVlVlh5YXRaOEppT0lGUksyY0Uvb3RDRVo5VTNVTGZZeW9Fbk5G?=
 =?utf-8?B?QmhtMVNNY0luRUNTUGpVcUtNM2pTY2dOcDJRSDJRS29sQVhNNFUrOHhjTzV3?=
 =?utf-8?B?RWlTN1YwR2hjK0dYMVpsOHVmcFAwTm4xelVzN2F6WUM3aFNMVFZzN3JsY0pU?=
 =?utf-8?B?eWkwNm1PS2hWVVVSTnlDNDlaelRlU3RKWGpCTkhybFJhU1NYSThMMmxhMTRD?=
 =?utf-8?B?TVJzbUdwRHo2SUI4dUN3K1NNNVlmYm82VGQ1eDBsQ0RCbTllOGVMWEJWT1pr?=
 =?utf-8?B?RjM4YXZTZU1zZEttR2kwK0Y4bWhDNkZVTVdqa1c3NEhOSEFKdml0UTJiZXMv?=
 =?utf-8?B?blpqaS8xeW1BR2x3d0NEdXlNajBPanErelZ1c3J0NkFqN0p3OURTWHFVWUxm?=
 =?utf-8?B?SWI5MS8vcEZRT1RWVzkwRDZEbHhhV3prODY5cENSMU9vd0dybnRNNGNCL2tr?=
 =?utf-8?B?NkNVanhXNnBsUFBWYlJyT2NyQ3JlbjNUeHQ0cUFLRExLZERTYUY0Q3Z1TjNU?=
 =?utf-8?B?RzQ3TmdXYWFaM1RvMkZOTTBBTlZDYlU5Q2ZqZTVhcS9mYVlncWIwczhyUUc4?=
 =?utf-8?B?dVNhTHMrWDQzYkx2VzlrT0EzVG0vQVFZeFFXc0Z3Z0NOdnB1cXFrOE9ra1RX?=
 =?utf-8?B?MTFnakQyZGI3eGpQYVpRbnVEemE4WXpWV3hHQVZlcU90anVnSlRHKzRMYktF?=
 =?utf-8?B?Uk16cXVLT3ZNTUtjYWtPemN0RjEvdDRtU1kyM3RwUk1VWlBHVjN4Wkg4OTNY?=
 =?utf-8?B?bnVDSmZjM1NPVjZmUWdoOVBCZUNKejQ5eGQvZ3VsaHJ3Unh2QVhpRW04MzB5?=
 =?utf-8?B?a0g1N0s3WFE0MHB1RXhFTll5UEFtZGY1MDF4Z01heTBOK2NUSjJ1SXZ3L1Bu?=
 =?utf-8?Q?niAgI5XFznk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RXk2Z3RlblJiOThTVytIQkNmZ2dNRzA5THJVQ1FhMTg0VGVEMS96WDJWclZQ?=
 =?utf-8?B?WFc5aUxQYTFJRXV3bldvK1prNUVnMUhOd1NjdDAyWWFzbDdydzhjN3lhVngx?=
 =?utf-8?B?emlGNndrNFd0SnY4Z2lYbGVrK1l2MEh2aXZwM1phQXhSZVFpYWtsRUQzZU1a?=
 =?utf-8?B?SWhIQm04RVVRLzAzbUVZRUFYMjhmYUExUEdodmluY1VmY3EzN0dpQmIwMFJu?=
 =?utf-8?B?U1ZFYmRHeGFNMENySDNyWXoyaTVYMDVKWGRTZ0lyeG1DWlk3NEtjTzI0NWt2?=
 =?utf-8?B?c0Y1RWN6L0trSjlFRXZMTFM5Nm5ZYlFLbExWb3FEM0tGb2xWT2F1ZVFnMGhQ?=
 =?utf-8?B?ZVZUVnFvZm1zd0FudE5YQWxCYlBOajcvVFBkd3JIalM5OVoyekZUNjB5VWxt?=
 =?utf-8?B?Wmg2bStvdUFweGkrWXFFa0FzTEJvdHpZMGd0REFzYncrSE5qRXBOci9LcnRP?=
 =?utf-8?B?NDFxKzh5a1dZa3B5a1ZJZFVqNE5sZXZCRUg4U0E3OU5nbVlQeEphcW85TUYy?=
 =?utf-8?B?ZlcwKzVJWUhpYUFlOC82c2svMWJtOVlzYnRwMkpYU0laRzh2bDFaT09QME5x?=
 =?utf-8?B?Ui9xK3RxbjVPNGRGck5QWkV0NUpQdzl4bHB4Q1BHRC9XVDhPbTZMdjE2eDBU?=
 =?utf-8?B?T25mbkRJcUlNb0l2S011Zmk0RkpTZFpuMTQwcmJLcDBTU3I5czlSRFg4L2x1?=
 =?utf-8?B?bGROU2o1RVZWK00yYUdUREZVZ1hXZTNUVFgxUDNsMWZEU29pQmp3dUVuWlNq?=
 =?utf-8?B?Ym9YdEtzNFFuU3pDQTZMWjltTXZmN0txSDdRaERsZ1JtMDVHTFFSY0RsTERZ?=
 =?utf-8?B?dzBSYmF4NlpORjdaVWpZSmZsNElKbzlqcGpucVBNcDAwbERIWk11UzR0aXhI?=
 =?utf-8?B?VkxJQkNhS01VRk1zVFZOZzhHZUEwank1eERBK3QwYk84UStOOFEyb3lrakt0?=
 =?utf-8?B?bldMRm1tTDgzdjM4ZzNhdHU1NzJmUEJsN0xwenJpdGFYanVIaWVINUxZS3dv?=
 =?utf-8?B?Q3B1Tnh6TktURkx2OTNIN3c2czJwQUlGSU1FUmJReVRRalFtaFlEemszVmFn?=
 =?utf-8?B?S0NQdnpKdHljejl3VWVxSyszWmdYdnRIN1lBTGx6UUNXaElxbFVhenZqNHBB?=
 =?utf-8?B?K1pSTGxGYytpN0MzSEVtTjkzbmROSDIyekt4NUV5YnNQNEpvcVJXK0dURUFH?=
 =?utf-8?B?ZUdIcWUvS1BIYk5aaXdpdVFKZ0RZMzNLcDhaMEExRTdETTRZc0dablQyS215?=
 =?utf-8?B?UzlKWW9uWjFtelFOOXFTdG9aeUJqeXBJNVZzdG05bVZQS0R3WnlKb3ZGcjlF?=
 =?utf-8?B?YzJxWjUzcHBVMmZSdFRob3Q2MGhqMEJHcWxZWEozN3ViWENINndKbFNhbXky?=
 =?utf-8?B?LzZhVVlLaGl0NjZtOHNENExFKzVNVm1paHhTaTRDRmdNbTBIRU1lN0FHN1B2?=
 =?utf-8?B?TUZ0RlFpd2VRT2lscFNWejVOY1c2WHdFcUpXcXlaZ1BsQ1RSaWFBak92enVn?=
 =?utf-8?B?aWprc3lOMlVSSkltbmlacGt3c0hGWkhOSEM1azFGcFJ3MHMwMzlQTDhXQzZt?=
 =?utf-8?B?a3B6MFNuODY2NzhiMVRGM1hvRTlabDRrN1kxS3Mwenc1SC9ERDhUNVZLS1gw?=
 =?utf-8?B?VXV3MG5sSGVaUW4wRVVoeGl5ejZFWVpPOGQ5b0hIeUNuUVJ4Q0ZYVzcvVTQv?=
 =?utf-8?B?N05MaXJxQlNyR0JYZGJ6bkNzOGhzNk8vWVZzeFc1MXM2ODdNdnBYZjZYeVhL?=
 =?utf-8?B?TkV5VDhDbys1SjhtR2d6aUJDYmFLbzVEdEtZNE5OUGx0L0ZJTFBGUnFyZGI3?=
 =?utf-8?B?ZDdwSDdkNnc3bXA3QmFXT3o1bStDNUpyT01zK1hBaC9OZDlqbWdDY3pEd3RS?=
 =?utf-8?B?dHFidlpIREN5WWpadFRqalNJZk9kWCtaL2JybVRIOHlienAybEdJRkN2ZGpK?=
 =?utf-8?B?NzhXVm1ocU1qdlVZR0JkTzZNcWNPTUpmcWRtOE8rdit0WTBLakp3bjZTV0Fj?=
 =?utf-8?B?NXppSmpaWnVja2d0bmtLOW13R0RxL2pGZlJRTUQrYW9nRTVuZEc1N2RpYWlV?=
 =?utf-8?B?QUxxZWVVaWI5VFFIb1VKbHRwM1BJOWw0d21ZT0lFa3JkZnVTa1BJRDBwMFVV?=
 =?utf-8?B?T3Nud1Bkd2F2ZVlEZmxDTVMwVTRrL09yUGVsajZuS2lZNXhIUWRXOXZRRkI1?=
 =?utf-8?B?QlpCT0M5bzBNRDhVazh0TVhRTlRhd3dZdFdRM3djeWlDaElQZGVJMlVzdERw?=
 =?utf-8?B?YWJwblptRXVNcHE2ZzVwakZPWGNRPT0=?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d74bea8-addb-451d-52ab-08ddd8d9db12
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 13:20:36.5809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5bjoTHd1TnBkc6Ky+tMSTF1DTXtAuMuFErnW4+gxAk/QaLQkN5C80CDgXmsVDCkw1JzsWjU2c6jENlmWbXuz4mPE0r1C4NcE1G1kR534mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8882
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Aug 2025 13:20:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7453

Hi Erik,

On 8/6/25 2:35 PM, Erik Lindsten via lists.yoctoproject.org wrote:
> [You don't often get email from erik=awto.se@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Signed-off-by: Erik Lindsten <erik@awto.se>

I checked the last working archive on archive.org from 2019 and compared 
it with that one, virtually identical, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

This reminded me to check with linkcheck if there are other broken 
links. Sadly it is less useful now that websites block bots much more 
aggressively so there are a lot more false positives and manual checks 
involved (and cannot be part of CI at all due to that). We have many 
many links (especially CVEs and link to commits) so it'll take a while 
to run, I'll post patches when I find the time.

Thanks!
Quentin

