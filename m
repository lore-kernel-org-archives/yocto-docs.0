Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C615CCD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:18:39 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47204.1778494717298163051
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 03:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=eMkqr5Ze;
 spf=pass (domain: cherry.de, ip: 52.101.84.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOrYw3/gLXj1wZy8oNRYKo6wbYFi+8zeQicOxPuuB6yK3mZ3u5iY1z7Hjc2+2T+T1V9db5L1xCDjJivj2pV/TmGRwpsZBQQ/Bapl/SC2egtYekyb/d/dfF+BklVHX/XyzWy79lHC4BVeTiTkkhxFqFuNSSrpFtsYma87EMhdy4uPQMJtZarSgvDRpFXcjl8569CkKY2SaGpMWm4NcQdvX8bkyybRJ940ZNQa2QCW034PMm2yN3rAMyUOketeqApyUdouicJeR36eocYM0RbFnW9o4vZ7TEHglapvHZMaxSTsOkQgABim7SbF3cnjVnE/e6PThj02VAPEnbkbd3s9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJwy6qgemjObh0OT0MjonNko6el5hLkCFqcX9BcnuYk=;
 b=B+DODYOlcex4fM8lDoOon5SYhkvCbJ5akFgZEezYByYxYkyk+/Y2NnT5mCMdCatNjXjq/9GCD2pEW7HI4ASFiyVdNI/LvyDWXdIDh8iuEFcfiNKpAajdlRkRErOjdWrT3luzsK0vd78xbOUkZkyTYIk0QIzh6N3UfgdE/va1WlTW04GKXOs9JJODyQ6rZjZ8JjoiBASDPEy7Qc1kgKPe5GVWbWqfbaEDXixZg1u5/cHR89yK7u4Zd51kwZPFD1qJ1iOxqtPCFaHQHtBAOf4uNGNA1FBIbywqmNhZ6sE0OBJ9zvvDNpLxUacUPxgCSdmrCr/nTsVyYxYulkcrpCBZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJwy6qgemjObh0OT0MjonNko6el5hLkCFqcX9BcnuYk=;
 b=eMkqr5ZeXPRkKSTG/BqyRy+1t5dUDdB+YCaLpPmX/bGRIV0SCsykgUbwrBIp6QIk0vdf3gyWFTCM7XMooZqSdmRL1y5OEV8elfUDKYwzjiGrCxvZPLi0Jresoax+l/gpACcTj8mEazXLGMVef0wBS9yMRzBiisL66RBcZzIqOfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by MRWPR04MB11287.eurprd04.prod.outlook.com (2603:10a6:501:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 10:18:30 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 10:18:30 +0000
Message-ID: <fb38b89d-c0e0-4cd6-82ee-9ca339e61bf1@cherry.de>
Date: Mon, 11 May 2026 12:18:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] Quick Build guide: Various pedantic cleanups
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <c1c86570-49ec-de55-563d-e43722f89573@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <c1c86570-49ec-de55-563d-e43722f89573@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF000001CC.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::854) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|MRWPR04MB11287:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf6e8e8-27cb-44a5-c059-08deaf46a62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	RFt7o8pdwWNTebStweXleS2N4ewdZW+mBJpduTWbGGhrc3jZiEu3rAzzeAawouiOTjSIAYT9inefqrAX4XJJNRgtyCiJyAXlgRH7uS2viODO+8OoORLCJAACGqWPHRCWu4Q2SqvNbdxUk3DrDANHvWe5KohsQaKlsn/S+4aOnkcGzpfKSOp5QHnsVIFsuOw45dFXRymhH7yhHgBsVlcqeZcrS+85A83oTUwb/tY7VXZ4IQPsDcf00ngohniRnt2jmAwza2MG6GqeZMtmGXXuSy7ottidWVxBMUWN/ivT20qo+4mHxcxJteBsCaxjtEyPAJy48pRRt3aO2D5A8xhX07MhxSOBwiz6+gJV54PlynnT5WXX6TE7anTmiDypIl8/NKjlSf7IxS6JE1qnt+VeW2KpjfsxMTtECs9/4wbjDvfVwtYx7QCkn5Z9YPWhUKpC0MeYgWqKgebTrrRF0bQmqSsPpKbo8xXLlq2mUbP+N1qpUauCGRkTtDsh3uZMe9wTu+sDpUeJsjwiTUG9oaa5VPywvruxKDorKxRrg0mrhaObx2Go2sdmLCKtOPpevYcWc0c8yZpztom0i1fXC3PlVbv+caZiGvUKjIdOWGrNAHi/H3wh2A/fWQ+NsLMzbxuv8Bzf0QBTIfFaFSBAhneA3DajLWusfQdWFP0cIqOTCgtAuEPRqCZPyNxUiwc7CBYH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YWYvMjBUYURvelFwNldvOUFIaFNxOGdWd3kydHRkV1lLOVlGaHM3c2xzQjlQ?=
 =?utf-8?B?Z1ZNbVcrRjUzdkRpSzBSWlJKSnh5c3pPcHBCc240ODZJM0JMVFl6eCthMG1F?=
 =?utf-8?B?YjRMYkZOcXliMW9oNWVwY3N3RDVQbWIvb3l1eCswQk0wWnEyRHJDRE9EdVY5?=
 =?utf-8?B?c3JsQXdVemVzK3ZsSkEvK1BPYXZtRzk2QmVQQlE5ZFJ5ZktPbjArckQxWHJ2?=
 =?utf-8?B?bXVpMzMzR0lJek5HTml3OUduOC9rd2oxVm1RQ0FyUHV4dHBocm4zSnArUW43?=
 =?utf-8?B?aDNYZTBVakdYb05Fc1R2Ti9uZC9VT1ZkK09mVHpNTVNycWJVcFZTdW4zT2dV?=
 =?utf-8?B?WkkrcDRmUk80bXd2em5WVFZHQjZ4MVlmRlJJWXZkSkhxZ2lMNXNIZ0tob2Ns?=
 =?utf-8?B?OUFqTjlhMHpTc0RsN2VhTGhMZG5hUDVwdVNoZS9DSjZvRVhaSGRsMUgrZmhB?=
 =?utf-8?B?Q1B5Qko5V3BDS3JSRlVFelhxVWF6NmUxTElUWkEvc1pYc3lDM2V4c1p4VjZj?=
 =?utf-8?B?TlUzc2ZtcExlWi9sejVhRHRVU0g4Wk85TDd0a3NqSHh2VXVxWjhMcWlwckdT?=
 =?utf-8?B?Z0E0Q1R0VUpaSGkrbmNzaERJQnM2N2R1cU0ySkJmekl1LzN4Q243VURkeThO?=
 =?utf-8?B?aGNVMlY3c2dkenc0RmVKK3ovTFRITlZSYzhnZnJCNGVybXVIVnFxOFhvbzR2?=
 =?utf-8?B?aWdkNGVrUGZxMjBWZkpWd0hwUFA3d0wxRXNxWDBqMnZ2V2NQSmxDeTVuejl1?=
 =?utf-8?B?RjNSb09mbkZ6UjY3aHREV3Z1dm9WaG4zYU5MMnFLSkE5djRJS0g3ZGd6cnVu?=
 =?utf-8?B?L2xUZWRhOW5YUDlRUFRQRXV5TzdDT0x6eXhiUDQ1MUVqV0p3dGdVb2UvUU00?=
 =?utf-8?B?bDJGdDlJRUo4TkgrTEU5bFNzdmlUcDhNMXV6cnM3TTcwYnRWSEp2d1RkalNI?=
 =?utf-8?B?cjZHRXFueUppaDRqZ0o3NTkvZ29mUEg3QWVJMWo3YnU1YjRPaXJzS1dUb1Vv?=
 =?utf-8?B?c3p2QWpmbWk3U0I4ZlBZRHBTV001T1QwZkNQbDlja2lwQU95MFFUeUZTYzFm?=
 =?utf-8?B?ZEhZRGV2ZGNYWGhseTloNzh2Rnc4TlNvMUFNRzJOQTRJRkt6UXNST0FqenpF?=
 =?utf-8?B?SDFQQlI1R1paNXUxaUxrYTFSY0liKzRmRFV6TVU2eTVCcU05SGwvTERnM2pW?=
 =?utf-8?B?RjFjQklEV2NUbHU3b01NNjkzOW1odFN5M2MzdUZyWENUNWtRZ3htQnhqakZG?=
 =?utf-8?B?NmlnMUFyWXVHOUhuTUEvTjc0MFRRamZmaGtzYnlIWlhPNnI5OERGSmQzbzYy?=
 =?utf-8?B?NlR1cXIxTzFIV3BqaG1rWUpacEFMZ1crR05NMEluTFY4RHpmY3ZzcmdidjNm?=
 =?utf-8?B?RXZrcjBHZDh3YjkyaWxCa0ZyeGI0WGRtb0FvZkNmNnZsYTQwMFc5UjdmVjA1?=
 =?utf-8?B?Q3BrdmFOeXZONHJpTldsdlRlSzVRWThxMUMvekVWR09Rakc3SkFUMmNCZ2R2?=
 =?utf-8?B?a0RnUVB5QjRpbEt5ekVtMFl6K1A2WXd1UVJRbGtWbFYrQjA2SGxESTJYRElH?=
 =?utf-8?B?SCtmQ0pHSVpEZUNiTEIrdHU0dkVlS29pcEFrSHhqRDFhZGlvMEpNZWhGLzNw?=
 =?utf-8?B?cVV5dGRPTU5sOHRWMGtJY2s2SXk1c0h3WXdZbzRZV293WVFyY1ZMTHJud0pa?=
 =?utf-8?B?d1RxSUFvd2l2TDJ2OWVESU5RVTlMOVZDWklDZHNGZTRjZWdlc1hGajQ0VDBO?=
 =?utf-8?B?QUxEbHFHa0hIeDVXM2RmK3YxUnZXbVVxQkZkZTN3Z3BXWkZOYWJvWWF0cDdt?=
 =?utf-8?B?K1pOVzdIQy8zcWp5Y0hjY2dzdm44VWRaY2t1L1BVT0VCN00rTEZlRGtpMUJa?=
 =?utf-8?B?OCsyaWZZSWtVbXJTY0pGSzVaWHBCUlNWMHM3T0pXQ3BZWEd2L0Q3TW1zNlFo?=
 =?utf-8?B?TEVON2lLcTU4bVEwNm11Z1E0enNSc3B4bGlPMFlzd3RlTFJlUVdlU0dMeHEr?=
 =?utf-8?B?bm5EeWVHQ0NvV1Zwa0dOenYrMUUrQmNPQndTYWZnMkpneE1yOEJ4S1RhMkw2?=
 =?utf-8?B?bDhrSVBMTUhtRUhhaWtFRUZZU1F1Q1NRaVIwU1FGOVhpSHFDTGR4NHg2WjVE?=
 =?utf-8?B?NTc4eTJxbkYvM281bnlrYmFaL28wU05zK1hOVkI2Yk1sSGJaVlYvMnJkdkw1?=
 =?utf-8?B?OGRWdEpyOGFYWDBuSEtCVEF2SGpYMENVR0lobDJuMzJ4RnVaV01jM1N0V3hz?=
 =?utf-8?B?WWN5R0Q3bnBuc1NueXBhL0hCSzhZQWFUWXBDNExvZVl2WGtOT2ZRVmxFYTJy?=
 =?utf-8?B?aTlDc2NLNTdaejRVL014VlkzYVdzaGhabm1IbFoyanJtTmx4ejV3QT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf6e8e8-27cb-44a5-c059-08deaf46a62b
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:18:30.7235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWy1GnZt/CoDPAsNRA50UMKMXeENSCjLZM9b+3oz3neCSryR/7KiiFrtnolADpxYh+9x7YOzEfKzWrwuXLTTh4CtUNNgtSq7bOn8nQ6AUK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11287
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 10:18:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9443

Hi Robert,

On 5/9/26 7:41 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Tweaks:
> 
>    - remove unnecessary capitalization
>    - add appropriate hyphenation
>    - insert missing word "to"
>    - fix incorrect link to point to raspberrypi5,
>      not beaglebone
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

