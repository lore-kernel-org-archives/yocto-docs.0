Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C64D2D0F0
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 12:59:32 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58221.1768309166918578227
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 04:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lsezWucc;
 spf=pass (domain: cherry.de, ip: 52.101.83.10, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QtcLBknfHMsg08pJo4rDuedLM/aodVylpXb4Y0uGh/XDJB7QAc8FRIbeBgyfl2j3dwvgu4DrLHZMiwVTt5oATQtsUbvOQn0FZmbuUiK9/zDoyEG8FFZqFZ98J2ga0LDl5Y+rXyyGXYZi5hKMFRTGp9GINWad3+JfCns39/OhO8+rkF0ZCZhe/Wh3o5cVVV5L4dTOOOzUUbHhCenXqVeHwfRVVZR3JcDcVN9kHq6D6wMTnUoHWlkP3YwPSjBK9JhNLkTZnr8mj887LuAAWXT3F6ea4x1ZwogSVyPAOw/KFL75UpN8DUQ3y5wo7wRKTmqw0Etw7rnXtU+/Q0RQH7taow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTtyct6Ozz9rDP77CbVuzd+IDInYzbVKu8cLy8KVnEs=;
 b=V/5zzroaU+klI3jzJYA1ZfRBo+fsw0H97t3FNN5Ki10cu/UakIoWWtFLvNkSsYgS4NyOLzl6Z1wYHL3eFD/HAoRq19TZu9laW+xXnuzvA0aUy47YwrMZx66Dp89cO+QZYUY5CdcjNu5Q+XsLnXO2MIRT6Ek/+JIuORL/6u8kh1ZmIKRT1+5P3zyx9KELp3vQqseLD9yKK50FeQRtxNoyPuoFogOALQGY2E2irf31QZhdG6dcuaCb8J2yNalDyUtO5WHR3x2n4VM1mKIt1LodkfoicloY0HZMMxtbDgM+I4aORft9SicW4+A+Btdssbk4uXqN2caJFgTbGqXB6obGrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTtyct6Ozz9rDP77CbVuzd+IDInYzbVKu8cLy8KVnEs=;
 b=lsezWuccBOfAH9qK7LjLeVnk/y/iQmdUq5SVl09gW+5vxCZji2iABD3WFFH8sOuwuClN9z4/7nRjgEgtyrusoFbbDZKsQnTjt6MrSNKUzhuJqRzjUKn28O3wXMamd/S3SiNAETYmf+9nL7xVf3e3e/H3WZ+0C1Ow9SE+tjcTmks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB7798.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 12:59:22 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 12:59:22 +0000
Message-ID: <a7206abf-e833-4d18-b2ee-d5a7af6db22a@cherry.de>
Date: Tue, 13 Jan 2026 13:59:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 13/53] dev-manual/libraries.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-13-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-13-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0027.eurprd02.prod.outlook.com
 (2603:10a6:803:14::40) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f1640fb-4030-4402-e45c-08de52a39250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UmFhSFYwTG1hS3V2WHZtR2R0U1NSRE1lZzBFQnpTYkxBRGppd0ZRTGs2OFli?=
 =?utf-8?B?cWlLcW8yQUczUHJYWEo4R2dDdFp4MFpJVWx4SGFhMExPRXRyeXlseS9QMzdJ?=
 =?utf-8?B?c3U2NCtFMzB3QnZSVnBNZ2puL3REZ1QvY0JPTHVjbzN4dkdOOWtHOFdIK2ZB?=
 =?utf-8?B?c0oveUJMM0dTT0p2eTRaUjJ6RDUyN0FaODlTU0lMTlB1ZjFVVlNVWFRQRXI3?=
 =?utf-8?B?QVEzK0FJUU9Bb09teXFUS0FSVUdsbDUrUEp4Q3ZPblc0OUpIQlZTSjZ0QUtP?=
 =?utf-8?B?bTNoOWJ5VlFhRllGSzJzWHRIWGlaUmhUcHBzdjRPSXp5c3FFQVJLb3RSWXYx?=
 =?utf-8?B?ZHgxVlR6Q2FwL3RaUHBaZzBDRzdXTlJKR011SlZIM1JtTGt2QVhaeHpicmpT?=
 =?utf-8?B?ZVpJRFRtd3hIaTNIYXhybE4vMkZ5Sm9lSFIwbTI3U0ZjaE5rSnV4Ui9kQ213?=
 =?utf-8?B?R0h2cmVNemhoTjBNQzVjYTZVR0dlSVNrYW81SnZVTlpocHJzSHFhSkFUYUs1?=
 =?utf-8?B?eGdlRGtwQWNkakdIRk9DeGRUODh3Y2REVkNTVFBDT3lsRTEyTUh4Z01zem44?=
 =?utf-8?B?SE8xVlN2NUJvMEhXcDFHUVpCVzQ0K2IzTkhZcXJYSG1QY2plZEFiT0xyUDR1?=
 =?utf-8?B?YlhqQS81MkUzdStLeVpwRDVGNTlMWUlmUDhrUVBFVkRFUGtUSGNId2Z6enVi?=
 =?utf-8?B?TmdEQU91TzMwcm9uZ1lsY2k0ZmhBL1IwVlIwNm8zK01uK055bndzemNiT2Nw?=
 =?utf-8?B?REdCSFljRjZOK1JOdERtUTdNM1dySDdtK0FsQ0RmUEZwOWpBazd4THZqQTJN?=
 =?utf-8?B?SWFIcmFzUmhudEkwK3RzZnI1UHJBQ2VDUEo4ZHp1YUtQOHNhSXA2dkMxOWFB?=
 =?utf-8?B?amVvcHV0bXdoaHhROTZ5MDlnQlZva3FkdnNiVjB2R3hOTHpmWG1sbkFaR0FD?=
 =?utf-8?B?TTR1dGRURys1WFlGdktRdndqUjlQVmhnTnpkcUFPM2ZDdlFCM3RHSHVtMzF2?=
 =?utf-8?B?eThBdDRGSWtNMk8zQXd3bTVsc1RLa2lkM29TeDI5Wjlyb3hlZ3Q3RG5BTk40?=
 =?utf-8?B?VXdxZ1I3VTdWK2NYU0p0aUljd3RoZ1V0QzBDOGZtUDdUQTVWQ0JCaFk0K1I5?=
 =?utf-8?B?aCtBS2lHOGpBODFvK1EyZVNxWkhYeDBUQzlPVlhlUTcxS0dvNWs0UDk5dHJP?=
 =?utf-8?B?dURHblVZc253UWdoaEdPWmVMUHFZdG5nVUVkeEtxZVAzV3NRc2dEcnY5ZHBH?=
 =?utf-8?B?M0txOENZV3h3RnVOY3ZHMVU2RUJYWUNQVlFFV1NNZlV2dU9CRFA1a2NEdHh0?=
 =?utf-8?B?ZmFYNkpNb3NvSGdyRFhqa1g1ek5wUkRnNWNvUHBKbzBmaVpvc3FWVnNGSXFT?=
 =?utf-8?B?STVZV3hYdHpFL1JiRUFqY3ZsZ2ZPYTVmSVZlV25DU1haVkhUSnkwcHppTlNZ?=
 =?utf-8?B?c2k1UHJoMXpOcm5pbkxiQ05wd3VrR0gvT3hiSkxYQXluYVNaVFh3cTIvWWg3?=
 =?utf-8?B?NVhFdjB5YmxueEo0a2Qzb0hPaUoyeDdwTk54NWxsM2pUTE1DaW9udXh3Ly9U?=
 =?utf-8?B?bUlERHI1VGlkaExjZllEL28rWitHYzhHL0htblJyRjBVeEEwcjVWdEhUWmRr?=
 =?utf-8?B?N3FXTnpWTVhKU21ocmNYdWovcHBIMnY1YWxjWk81T2k2eVNLdDlQZ01XeDBU?=
 =?utf-8?B?QmIrZ0hybHovNlE1dFloOVhQTGw4ZmIwdzRsZjJiNjhtUlMzS042Z29KSzVl?=
 =?utf-8?B?M0U0Y2w0clg4ZzYxTUQyTzhBNExjUFpvTDRWMVc1SnlJd1djMUJaa3R1eXV3?=
 =?utf-8?B?aWxiRWppNkttMFg3M2hGYU0ydTVKNnEwN3VkSUhxYTBxdW9hUGtoRFQ0TGxq?=
 =?utf-8?B?aU9LOHBmNGkyT2VHbUtzZFZYeDE2MTVSekdDZVlxN0Q3UGdyMkhIODV1TUF5?=
 =?utf-8?Q?bmr5zwCu8KDWNdTiQxLmzZ+O0VtHMAwG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dE4zM0dCempWdGFPblg0dU52Si81N2s5UlF1dnJzQnhFemRlYSs1d2FOWWo2?=
 =?utf-8?B?bjBsMkswd2FsR01DQzhLNWZ5SEJwTTBqWG5oaGlGM0czeHNuU21tRUNiSHpF?=
 =?utf-8?B?UFQ2RGY1WFVkRnlhYTYyR0Z0MS9MTTd0VThGOTFyQzhqVHFrcGlHa1Njamd6?=
 =?utf-8?B?elV6R0REWHlaaGZsSkdUbFpMRkFTbUNQMmVKYXh2ZFRWQ2IvamR1Qk5EclVV?=
 =?utf-8?B?bVF3TGFHWVM0cmtiOVlDWmhreDJQclZkLzlmc2lrZkJETGRoSUpsbWU3UGpr?=
 =?utf-8?B?YmlqUklNbjB6S05YVEIvQlhCTW9PdGFEMXJmczVCb2ZBOXJsVTQ4WlhwNWNs?=
 =?utf-8?B?NGl6SjhTNDRGZE1JdW1MNGVKNWZvWk53NXQrSmpwT0hFY3N4RGFXTno4a25n?=
 =?utf-8?B?T0tKWmUwUkpDMU9jalREZ1VlU0ErOGl4dUZIOXc2dW1MUXlaVG4zRUxPV3hF?=
 =?utf-8?B?ZGdiQTFvUzh5WXdSdHIwSktxZWl3Mk9DZ0dJUUt3eXFOSTgzK1ZNQjZYbUdG?=
 =?utf-8?B?M2lBeDVnbUtJSDdCMlFpOWtWR0p2cUNoa1ptRlFyYXFycVNxdDRZZk95cjFU?=
 =?utf-8?B?T1c1ajMzbk1Pc2JndG5SbUU4cVMvL1htdWp0U2RmS1FxSXQwOHA0QjdoU29J?=
 =?utf-8?B?SFJuWVZteGRSeTZFQWlZK2poNnM4SXdRTzBobG9mcUg0Mi9xSkxDeGJ0MnMv?=
 =?utf-8?B?UDNpcXE4aXZhczJnb01YSE1oT2llU2tqRTF2T0kxSGFxUWhkaEVnOEdWa3ho?=
 =?utf-8?B?SjVPNy9BSGRSQ3pVc0N3YmlEdVJlbnZwWGpmQ3FXY0JwREhwUEk2dTNTN21T?=
 =?utf-8?B?YTcwY3BSaG1Rbk1WOURreHBDQmJvZ0NWTFhQbXFjWDBkMjBVSHpHTjhESXV0?=
 =?utf-8?B?ZlFnZi9yQ3BwQUFzZW12M2FjM2FLRTVsdnZtakFBb252TDFDMUhURndpdmRI?=
 =?utf-8?B?U2puUERlZTVxdUxDT2JuVm5FY05UQVlBdVRITzl1YTdEVkFOclViSEJaSTRm?=
 =?utf-8?B?RjgxSXR1MUtaR1FVMjFFRTBEcXFrZkVFYlV0alorWlBQQVFmN08rWkZrR2hP?=
 =?utf-8?B?a21qMWQzcG5kZTR2ODM4NXVuUk1tLzk0ZEtQWjBicGlwRG14RDNkd04yQ0dK?=
 =?utf-8?B?akpUQko3L2tOWTdZZHdtZDlZa2QzYTdSZVk2UWk4R2ZBWjYySWswaUVhMXly?=
 =?utf-8?B?S0JQSGRHSjlONWd4S05rR1k0cmpXMm1JK09OSGY2amxtcmhhSHhWS3ZhWm53?=
 =?utf-8?B?cjFvMWJFVVo1NWN0aHI1U2ttWE4wREM3SVo4dWlDOWVveVNqU0pJWDZYcnZk?=
 =?utf-8?B?c3I4dlZWWldPYXpWYTdRSHVYRFRKaEFteUVDOGJEYlQvREljNDJLU1pIdlEy?=
 =?utf-8?B?d0x3NmQwanZ5anJ4UGtnTTQxUld1bWNkamNmSTByNklYMHZoa3IvLzdFdEdU?=
 =?utf-8?B?TlJNT2NwTms1OWxBOHNmYUx0cG50Rk1tVTc1RmlYN0NJTldRVUFtcmJIcGNh?=
 =?utf-8?B?bmIvTXkrTjJxbFkzS3RRUXZ5Rm9DVGY5Y1RDUE9lMjEyeENHeFNkUmdKVlBs?=
 =?utf-8?B?bG5DZWtZNjYzaGVFSGNIa2pMOVdCQzFTZmdxOTFyanJZQmZQOHVvT1VqOHd0?=
 =?utf-8?B?a1VoeTNEaElhZ0hOWHVwMjNzalhPQXI1aE5EdENJV1lSU3gxWkcwQ1RLQlQ4?=
 =?utf-8?B?UUhQcDNmV3I4TUlnVHNjSHRFRHRJVmh3cWZWYnpSMXcydnJiMWNwaTlOS0Zl?=
 =?utf-8?B?NW1CMWJQelQraVBDN1hWRFBQWFo4TUoyYXF3NjhraFh5SFhRaUtrYjhZbHFo?=
 =?utf-8?B?M2kxcjJrZGhDeVlJUnlKdmY1MWhrajBxeTB6QWlZNkRlSU9KcHFabUU1SFVK?=
 =?utf-8?B?ZWl0UU9BSXcrSkVzVXRoNy9rSjk3QTU0NFJxdll5dzlGU2wxWGtiQ2FTS09u?=
 =?utf-8?B?N05GY2o3WVpRK2hZcEJmZFV6cE92bG5WY1pNN0dnNHhwWkdZekthejFkSlZt?=
 =?utf-8?B?SVg2OURNUENHanR4RFF1SVF1VzVSbiswM0s4SXNNT0pWRGZFWWEvYlk2ZDE2?=
 =?utf-8?B?dEczM2NkdVFOMWQ1R0N5RGRMcHdNVVh6RGhzY0FPSS9Wc2pSa2s4L1FqTzVL?=
 =?utf-8?B?RTM2VVN4TUt6TFc5TEFsOVYxSTE2VXdjS1Zqd0VTL0xpaGRQQytoUllyZUZ1?=
 =?utf-8?B?MG14ZkJCQXVmWjNIdFd0c0V3dVg0UStjQUUvYkFRYUFGUGRWdG1ialM0YnQ5?=
 =?utf-8?B?L2JCRzNZSnN3Rk02cGFEbTBJaFI4aklzL2loejRtRGtVUC9YcHF5Y0J2bU9L?=
 =?utf-8?B?ZThXUjdhU3B1aUoyaUp5RExBRkdCSXhxY1ppSXkwaU1WeVZsbms5QT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1640fb-4030-4402-e45c-08de52a39250
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:59:22.2447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnYM33wQDjnie/vB0TkHKYY2oDCg82oDAGOM60uTFvEnwLcTmas3e0z9moOqRCnVPVg1LXA/Bsl4ORzq0JIpBb7KKfAqDJ2mp2pyYWUhQXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7798
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 12:59:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8494

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

