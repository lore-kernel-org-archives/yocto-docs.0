Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13796.1795093200166415733
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2026 05:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=F5xAFI8s;
 spf=pass (domain: cherry.de, ip: 52.101.72.28, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sB61kENK7F58pZ//orq4rnP8a2hfjVRqspOJ0C8X341/dZodL6eLzTk9h+MlP6aFcnbAvlT6PHpRSbd5QjhoiRyUvP6VQq0/8Pajy+Vae5+MUbJ/myEWgmtmCy1f1hj2O6pPHt/lbh85Z63qKFbaHn3qXncgcSu5zQ/vzP2sOwmr9dYb/QuZmbovk1qSELN7ZD1uFNcHw8F3Qfd5BWFmBDR20YlFN5rW+4oxBP5X4yTAHWQqxVFpls6D5tmjI/OFJZkXZlKV+oW8u6i+c6/seGR7PYwTjbNqcVxohgFW7gW39zYxAxLxwrugz22u7t1SaPgRVG3xMJGYF19NxNu38w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZesLiFjNDwaBHW7q8tYyza6L7M+LYlEke/ybdVKt/5I=;
 b=VhX4+HfiZjauVZUQKtXxHE3zMVtfPYQb0fwotOCfTt79QcTQ3dVPW9RMdi84ETj6TfdYI7nlCl2WUMImIFSXJpvXoNwatgd/hLIjbf82YQWe8Qgnr1fVi3lnKx61+xa0ZMfcB8drw9c3ka3OK3BSv+M39+qbjV4Yez97fjJnLyicWc69pkjy/D2V5i901PLUcedCMKVWlr+mxAo+ODUlCb6Ue+VGuL6GB3wgUjKpKE4U+YyCgMMRkAfU4aMb1sc9CChSe/j6u4Xo2tM/lxiVnOauM7orhrvG/Ws/UimHpNvYSrMTB0+3pwlOelYV/jXard9YvX/DSksyKou0mQbVjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZesLiFjNDwaBHW7q8tYyza6L7M+LYlEke/ybdVKt/5I=;
 b=F5xAFI8saGJc36us9pg17Dv86C2w/+5HypwmFeci4rLe6KpmhbXbUrDz+YcRkjqo2E0EdyBVGhwGgcNhLcZUGb8rOnlI3BHpZLLPl6cc7VJcozfJYKtu8Wc5gGwTHdEPu61rotvlr1DzPj/onA8Rwf6Nlyb3wfcTSqabXWSVbcc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by PA4PR04MB7759.eurprd04.prod.outlook.com (2603:10a6:102:c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 12:59:55 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 12:59:55 +0000
Message-ID: <758fb30a-350d-4e4a-8646-46363475ebc0@cherry.de>
Date: Thu, 19 Nov 2026 13:59:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] tools/gen-releases-svg: simplify tempfile usage
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261119-gen-releases-svg-fixes-v1-0-b6245fbf8294@bootlin.com>
 <20261119-gen-releases-svg-fixes-v1-4-b6245fbf8294@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261119-gen-releases-svg-fixes-v1-4-b6245fbf8294@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0092.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35c::8) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|PA4PR04MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d4354e2-8209-4e39-59fa-08df463d01e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|10070799003|1800799024|18002099003|22082099003|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: un6/I+qcqVb6a1AB381ImHuUpQgFRaiPO0b2931Ch73lEIWK+QsRbTYQUNAebd9jMdJY6+nG5BcTyj3OsT59+gySaMLLWA3dx3V0DtXRSKsbPQd2/GunFLVdtFhXfDiPKnHGlpdWZLIZHkdThAKY+6xeqgDV85ZwNYmP0ZiUzIhvEE+Tcmal6PToPL8eJOYMYzmajbxXB/v85W1g0wYQvRSRD1TSZwjtKlH6th+1dxLdv1+C0P4/0q9N8P3Bfr4HjREHNo4VKSgOuK7KAX6Aw8iT5Cj/0jjF07osdOwPDHJqb77f5Gd1asGVM0ull7ADOYGyeDPCDMspBlX4YA0WZeiAexjep8Dxfi3bU3mf9+BaFYZunxtKAIigxoKwjwSGemREJL1fT/b6mG2KTPMM34DzwwJERUlOxx2Fsl2XwVgfkIGsynn7vuIFd6viqsA9+07Ow7Dvt8tcmJlfKSqvJ+FYGLo8VVs/luIEABhxq/jo183BOV2PlAq1EJC4zYdy8Xgc8YitWQzGuc276EOTCD7DPmNIA/WnKa1zgQp8eIStjhLckxOoq07BZBGLT2ZmYCd0RPP/R2u2UnayjN8lPoxpY+QFVd91xmri6h+ZxcR0syGCrGePb7e+ryqiHOcNQSIffTGTp8JiCvV8ivimh2bC8YPNTY3DeVHbxic208Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(10070799003)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1ErL2pmcmRNU0sxenFyUE9zdGVSSFc0aHMxa3Nwak82RjA3cTgyOGRsZXov?=
 =?utf-8?B?MnNLaVV5VXJUNUVlSXRNMXZHdWdYbmtJcWVQRnpvanQ2dTg2MitxMXVkcnlt?=
 =?utf-8?B?cWxsZWVVZ0JQM052dUVJODdlbGlOTlJQRUt5WGI5WSt1MlJoenBsRHN6TFpG?=
 =?utf-8?B?QnJKVm1Yb0U1VXhxbFZUV0lESW8zMytyT1FES2tmRUk4SVh2K2cyblFuU0cx?=
 =?utf-8?B?TzNuVFJqZFZidmxTZjcyYjJpdHVlcmhGazVSNVZKd0ZmMU5rYmpaWmg0MXNt?=
 =?utf-8?B?SE5RY20xVHNLd3FISTNwSkFLN3JKdVJkT2FoVWJiSVlMN3pmNk45NzZQMU5h?=
 =?utf-8?B?MVdjRkdIUVUxYnZMYjJ5RXRvM0UwSUpEbkxyRUJzTno3QW9GWGdycE44bWNZ?=
 =?utf-8?B?bFBjQVVSRzR1L0oyMlRkbzM3cWlNVWsxSkdWTHBuVkY3RTBBUDdaTTFoT0ky?=
 =?utf-8?B?bzFRT25rbU1pUWpNcDFkckJISWg2Sk8xR1hpaVROcnlnMUtwRnJzeUloNlVk?=
 =?utf-8?B?enpKdFJNbzNQOWF0QXUxdk9IcUV4cVhERUVsK0lxK2pQNWF2U1BkejRGdERm?=
 =?utf-8?B?Y3NkM29VN1k4eWRpclVmYVY0ZnppUkxyaFlWcW1zMmVhOWxibzZzUFRoQzVS?=
 =?utf-8?B?aEVSdk5mOTd2ZmJpRkhQdFVvWC9leFBsVDFvWktQOTVXNU81bjVIWWJVN2NV?=
 =?utf-8?B?eC8xbVlTRnpOMHQ3YXBZV0cvTGo0eGhibmlvYTZNVVRzbTUrUzVkL0w4UEwv?=
 =?utf-8?B?c1BZeUJMNmxCN0FpNWtVN09zS0liNXpzNys2dDkrNy9xVjJmeTlORkdKY2NQ?=
 =?utf-8?B?Ymh6Y0JaRnJ3TEZuVUpTbjQ4cndra2dTZklmYzlyL0dYT3VrRThYMXY1ZFlJ?=
 =?utf-8?B?bnJpSVpLazFYenJPRVlBc1grSjAvUUJ5VDR3dm1BVEMrZjF0dmFDNUhTS0dx?=
 =?utf-8?B?bDdHbXl3MzNVdUQ4WC9RU2d6bHg2SHFHdXZIekljRFhrSnZYM2ZiL1M5SkJO?=
 =?utf-8?B?YnQzQWlMaWxocDJkVWV5Q2V2VGloZlRoclpKQ3FlN29VVWp4bXhzNXIycTZp?=
 =?utf-8?B?N1RWRFVXczZkTCtaMFE4Qm5zS1R3aW44VlR5TWtCY0F2Nmg1WVF1c2E1K1JY?=
 =?utf-8?B?dW9oNmZlUUVRdmZmUUZ3ZTlMQUFuTTV1aG9WaGVpSlRHNDMxVnhsNVJZRVVn?=
 =?utf-8?B?UUFmbUdFZVF0dm5uZ3l5SWFXYmk3c0M0N0V4ckE1a0VWbzU2emVLbjEvWkRW?=
 =?utf-8?B?Zm9wenFKbWhjVDh4NzVTMEZCb3AyVTNBYnNFcFc5czlqdlF3amM2Smt2Mkl0?=
 =?utf-8?B?RDhyNVFtYlFqNUlkckp4eVNwa0xkQjZBdmt4akF6cHdNeVZ1azlOVlZESFl2?=
 =?utf-8?B?Vy9OdVJ2RTMwTDdmV2NKN1lrUWZVS3NGV01KTXM2MVZobElPbWdjNTVUYkJU?=
 =?utf-8?B?bVJpTm9aUWg0eDFPcW5jZmdIYWhYVGt0TFd6REVSeElyVHRVV0NXa1JydXRE?=
 =?utf-8?B?RmtaQS9TdE5ObnhjczVGNHcyNWVKdVVHT2hZSnU2SzdGN0Ftd0lkOEtMNWda?=
 =?utf-8?B?dFdjTExRWUhjMlVhZ3RTY0RqSWZRUmpCMTRqWEQwRTRyelFXTk5TTlJrYUZy?=
 =?utf-8?B?L3U1QW10NC92TlJUSUNsUjFibS9Ickc3RDJ4OFVCWmNEVENjZlRacDNlaUJh?=
 =?utf-8?B?ejhUQmNXOTFVMUZZeHF2bXNxZ3o4RHNuZ083M2RxUmpaRjRpdnlaWVhVcGVp?=
 =?utf-8?B?UzdvY1AwRTNnZk5tVy9uMGhKTndnUGFidlg3MkRZYTRIaEFKSEZxbTQ5Zjcv?=
 =?utf-8?B?K3dPdzNUajhiK3VnUzBkK09FU2Vxa2cyY2xBRE5QMlh4TWx1YVp4S1hKbm1v?=
 =?utf-8?B?R3RmcGRwUG5sano0STl3MU5PWitYOSs1RU9ocW5WVjVvQy9vSTNzdmtCR2d0?=
 =?utf-8?B?RlptbWFJR1pKT2YrMVh3c0Y0SVlzd29CWDhIeWxHYnIyajlhaUZwUCs1aHpZ?=
 =?utf-8?B?eU8wUWhraXJVa1pLWDNlN1E0eGRyRVl4eFdnSlZ2bEZXcDlIRnNhdGpoZFlD?=
 =?utf-8?B?RVl5NnZwdGs4Wk5SZ3EwSUtYMEdoZTZxMWlyRmdzWEtJN2hKVllCeURFTkdO?=
 =?utf-8?B?OUR4dHBkcG9mK2FwM3AvRW1yTEJURk05OWtxSnJOWlRJRXVCakJESCthcFg3?=
 =?utf-8?B?alVBdDdEM3M1NXhpVG15ckpnQzNtRjJ5bzROQUlrSGFZN2dQVGZIZDhtYkRX?=
 =?utf-8?B?YU1PSkkzUEZqank4ZmpWK0lSb0Y0Y2tqN0plRjF6cWl3NDNUYnNzOVRKT0J0?=
 =?utf-8?B?VmV2U2JBQ1ZzZVhoN0NTSmJwM3VrUjJIb0YyZzhSOEhWSjEvQk9YN2F3WkV6?=
 =?utf-8?Q?sAdtYc/7GQ02gjF0zYWb/viLqUo7zNZaiYzHnxVyAkWDQ?=
X-MS-Exchange-AntiSpam-MessageData-1: nyyI4slplUy16QUM1iJSuy5Xc80GLecgu/0=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4354e2-8209-4e39-59fa-08df463d01e3
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:59:55.0261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2EN+rCOfqTGMxbUidbpA0cP4cRnIAWR0LkHxvmZgU4e88CCniBvshGa7nyiMSUe2CyiRBNtNF+sRvc7ozTBzcS6JR5AG1G9eiyRpO9m4Nqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7759
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2026 13:00:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10805

Hi Antonin,

On 11/19/26 8:55 AM, Antonin Godard wrote:
> We can directly use tempfile.NamedTemporaryFile() to open a temporary
> file and use it for the diagram passed too mmdc. Make sure it's flushed
> before mmdc reads it. This simplifies code complexity.
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Reminder for people trying to review block of codes which are only 
reindented, use:

git log -p --ignore-all-space

to see only meaningful changes (though be careful with Python as if only 
some parts of the blocks are reindented, the behavior will change!).

Thanks!
Quentin
