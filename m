Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA88ACD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 05:59:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9325.1781675953823890199
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 22:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=T8VdEM7C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0628fa2e08=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H50Zck891991;
	Wed, 17 Jun 2026 05:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=XCgxtILifULvOgfNXg057N/BdMsFCpZ5MjsKGs3V2kM=; b=
	T8VdEM7C8Kcl7QnodduFcyrCeVKghsV/6FerRHX9LjIFpu2yMRuJOV6O2FaCyAGM
	lWlfVIk2e7b1LU789NmrrjYkh3zb21ecWAlAH73366jRdFbEPhhVSg/H8x+5bnE+
	gqsQNfEGvtj05Ga6yuIUv5SFZH+AIwVgZr6saBuDb0WjneTg0HvYcpnhSeqqF/j5
	WGogxMfE4GM9z60x8CkD7gOSk7xFSKWLkBTerKKdNZnvrfHCsWskAaCxCkT1427U
	2kxvOxIo9PwLJ29wXNxP7xjZQHLgawnkUmqR2EAfk4K0hEpWSAP89UDiw7rWDyUv
	BtJc/nfFz92JXL+ciHvHig==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010015.outbound.protection.outlook.com [52.101.201.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4euefc0hat-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 05:59:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFqLjM8CA0848keaUURD1GK8gm8RT3pXfVXByXa9CxyBf2aqJvtZXUCbwYJdKuuYcu3Pby46JRQwRMa7hTigVCX38cN8oQXJP/CbzCQ/I7quySasXOXRSiBvHT6r6BW9C9hkQK3B0JkO40PF+UDcFbyAPC4jzRxYSAzFdUIYlqj4e7ZvqW4vIF0iJOcYxZ3/rQrtZy86TRNRDi3tmI1FWUK//CWppd/aJOa9RIBZtgvbJw/99V48MJhq+XuZN0uHxA+AZdVXKr9LwBtrUCyVIuxKAkDIXSDu1fKFQFFwcK1h8bDc9natqcpsPoIQASrZ3usJZ3vVn2V5Mm6pLQivxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCgxtILifULvOgfNXg057N/BdMsFCpZ5MjsKGs3V2kM=;
 b=C++M0GPtvF9DTmxd756tsxdickobR55ZO2iObYdvafIvd1AWpyd9gFNsZk3efgsehWjneOnf+Ap6TKsPEe/dOpt+FwkSiWf/IAQKMlsIb2kJJ7IOqlcO9ZJh5tOGtKbY743si+nKpuAQbR0TjJPoyFq2Qz08UhphNHOebkeyd58cMd0J4tjEvND3a9m9oqYo0AciVM3ZWEYDkoRnX4Np5gpVz/jVekl7gjqJEOUkC+4ZABpV0V+SFgDy2SjfHIowejlVzKyIugzcwHE1j85XryqRiGmaFOajkzuzGARo3d5jLLmkKuiHS/Exlv5VClT//jUbf/ZFld+ZC37NBYmejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB7254.namprd11.prod.outlook.com (2603:10b6:8:10e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 05:59:01 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 05:59:01 +0000
Message-ID: <4d6c073d-f542-4396-b59e-f8d7a741f18c@windriver.com>
Date: Wed, 17 Jun 2026 13:58:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [docs][PATCH V2 3/3] ref-manual/release-process.rst: add patch
 acceptance policies and stable point release upgrades
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: alex.kanavin@gmail.com, paul@pbarker.dev, Randy.MacLeod@windriver.com
References: <20260616052012.3286114-1-Qi.Chen@windriver.com>
 <20260616052012.3286114-3-Qi.Chen@windriver.com>
 <DJAK0WH0NS23.251BHRSNA3GIJ@bootlin.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <DJAK0WH0NS23.251BHRSNA3GIJ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0137.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb03a9c-2c6b-4b7d-543b-08decc35876e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|4022899009|6133799003|56012099006|5023799004|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	r9NMZJ5132j2LET97AGwPWhuhAiSJdsVbUnpkMcsXrPSNzQ9XzUz+QPkMHwzUuPEcap97h68UVNfIbEoxpG8GN60StG44pLtnpdMzWzoqc58OwjwG0KtwoPNhYD0/EqEcHXoIupi+h0XeYkrpzAJIdxHPi1Opw/GZ91mZEehYtNlZ1FE8I23EcnaHehUHnwWrIEdN3hB/Nb2t+6ZWevsSwrRZMiRFaZe5NxrgSATlLwJZQIqWlT5G53u/NUZVbil2pYUV+MgktgN6MzbFVTlkNvnC6jcHPtn4BVL9fpThwp44ddKgzec47no2zFNxrn0QeZdWOYJ+uC1G5+U5pbNJxip0As1lY+7/7+46TD6z9f0Ts/TYTNUrCREeoGpvkYGxhC4Q/bay8icI23E4vQJFgCFN10/1yYFkuFbRTG85uoarVm/n5qzLCIMYiY65aK7YiB0rZOxE9H9h77k/gYo0p65lbkWfHSRQr3GLADILwbqaFsFb7oOuyL3RPGz1jpcS4UtDhnIiKtP0Yntx6O+DfGhV4X6JMmyEYs9bdN3efaajfc02SZdDUJbE9PVwzw7CjqBSNlzJKmSdtkqPSjdrwpFUWO8KNi7bgyFxjzy2prUyMuUSLdImsarrNRNg1LFg8pRVsjtMSpBwOxWl04vcH56od8y0D3Gl8HSOTnbQIzARSdqVF6ux1JeGTGtrvuW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(4022899009)(6133799003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2s5ZHl0VmtienJDSER3VGM5SllQMCtwMHdZRExQdm1uQ1crajlVU2tuM2Ri?=
 =?utf-8?B?OW5BM1NyMkZlK2g2NFY3eDZoNUk5YjhMRVg0bjNnTWgvNVVVSy8vZnhxK2FR?=
 =?utf-8?B?alA3ek5DVEgrOGtzUkgrRXZMTkN6bGdscDNMdCtzNXJiSFVuYnZveU5QeTJp?=
 =?utf-8?B?MmVNNWlxaHlIWTgzMTdJbU9lWW92Skd6NjJsRTlZcUlPdlNFTDBDUm4vamRW?=
 =?utf-8?B?b2Q4TjVnVDc0SDBKT21uOWNHVEVVTFV3WU16bVp2R3lIbDVtdHhFRTErcnc1?=
 =?utf-8?B?R0VMU1ZLT0RkNFJFSE5oQkFhMlhGdkJWMXpjV21NN0FtQjd3aDNyMFp6RDd4?=
 =?utf-8?B?OEJxYS9yWHdmUkxDaXFSN0Z6NGVVM3BBM200RXpPRG9HbmYyYzd3bDhRbzdL?=
 =?utf-8?B?K3N1cU1hL2ZSTFo1MzAxb3h0ODN6U3BhZWc2cUdCV1dSdDRnZTlGOHJ0Wnhw?=
 =?utf-8?B?NjNwYzl1VGhidUMwb2lDMW9EQ3h4ZnJFRHNMNmd6Zko0bmJvWFFlR0t6dlQ3?=
 =?utf-8?B?dHZpRHQrQ0MrRXlQZHAwcUZSOXlPMmFaNTBUSzV6VEdtcWFFUDZWaUk1ZzNO?=
 =?utf-8?B?VVVhL29nWTFVc3dmYnNxM0hqb1ZHd0drbWhSb1ZtV2xNaE1HRHd6YWs0WU9V?=
 =?utf-8?B?a0VpOW5zMlVVWWVzNC9mcUVYNWl5NEthQzhTMENmMkZQNzR3Q0IzcXpWaTdR?=
 =?utf-8?B?dHRtd0pHdHlXTU82MnhSRnBrU3l1UHJsVVZSWnpkQnBvaXdFZWw1Y2FsS3RM?=
 =?utf-8?B?cGxwc0ZLQjFqd2RuOGZCN0FDTS9Xa0JoNXZzVTJRdzkybUN1aGJkbTNUTmZy?=
 =?utf-8?B?NzA4Vjl6bGZUd2hIVllCbldONlFzaStQL2dUcmJJRS93WGd0OXlocE9SYjFq?=
 =?utf-8?B?WUN2dUc5c21Gay8xUTBGRzFVQjVnVlpKeFFCYWk0MFVLS1JpMHpDMC9jbGx6?=
 =?utf-8?B?d1NVVnBrMTQ0UGpTUXRFWGZhMHAvS2hSOFZQNjBORUc1TFdTVFZUUXBsV2xQ?=
 =?utf-8?B?QnRnMzJVZ2RPdVFCaktvU21yaVVFL0Eyc3o2RDhBVVVSMkMyMTBQYkNkUlR0?=
 =?utf-8?B?UjliY09acFhpUHNLR2RERDdtR0lmdG9GNFFjWW5CTkxTMVhsYnR1RVMzOVM1?=
 =?utf-8?B?bFVoenBCSFhSSTNIcE45Z2I5bVhESkJ6R2VMTi93akFGblhwVzVFN0drZE5r?=
 =?utf-8?B?c0g5djE0U3dnRzg0NmhXZVI0RVN1RmlFT21rT2VybmlPdUk3dHpyc3d3cU9H?=
 =?utf-8?B?MVFOci80blcwUnh2YjlpSVF0RVNJMzd5UUgyUmM2Rm1ZMXNQSzExSjlGaVpp?=
 =?utf-8?B?Mnp4TllWSVEwM3lIYlVYQnR2MHJWcE50clBoc2RWd0NSNTNxK1J5RXlXMW9W?=
 =?utf-8?B?TUpaRmZOSUI0SUFsRlhBbWhNTkV3OUZ5L1dOY21qL3hHTEl0YUV1OEd1Z3RB?=
 =?utf-8?B?SzBNYlllU1hGcnpVLzRaTkdBQllDUHh5enUrZkdramk2bHhzMGNsaGNnTWk0?=
 =?utf-8?B?L2NtS3hmbGt1UGR5azNCNmUwazV0QW9UZEtLRktva1B4WnNnbW1SSGJvOHRa?=
 =?utf-8?B?WmVPM0RLbHc5RWlHaWwxMFVZVGlyS2ZKbXBMYjRndFhDci9MZGptNng4bmFG?=
 =?utf-8?B?dXFPM2JJZm03cHdLUEIxOVFtc2YvZ250bCtRZU5raWd4Q014T3JISzVzT1B4?=
 =?utf-8?B?eHRyUzdZOUZ1bWltTjk3V09CZFBoK1IxNTJuTmljeXlWOWlKRFdKcFpuZ3hu?=
 =?utf-8?B?K0R3KzByR3dUQms0UXdGZUYremlYTUNzelFnNzVBMDZUOVVSWHFHcmg2NENp?=
 =?utf-8?B?SGNIU0RRVExpNHB1RitaM04xMWZkUko0Z2RxRWxlQlgwMnF1WE5ya2s0UXdx?=
 =?utf-8?B?ZTJ3MzFKK3laQm92SmN0RnFmU3lYdWh3S2RWUDZ3MUNvMk1sOWVTUVoxVlhT?=
 =?utf-8?B?dktRNWFVT1BXSWFlVGs3cmtqOE5CaVhlWmh1aEtUNmRxM1pRbldhTUZhSEs5?=
 =?utf-8?B?dmJGZkxmNkZnb1pKdFdFVWI1RmRWdmFKYk5qM25QbitKRWM1ZkQ2RzdXSzd0?=
 =?utf-8?B?U3ZibDBYbHdqakFZZ1RYalh0Q1BkeDNBVnZJNnBSMGlvRFE1aDhYTjJhcHhD?=
 =?utf-8?B?cHI1QUxqWnBOeU9TT202NWw1MFdwRU1PMysxUGZCaTZwd0xsNkpIRkM4T040?=
 =?utf-8?B?TW1yQ0xtWmZzcmp0SVNGcC9QWVdsUGt6anlzNEYzbHBKZGFRMUNlbTkwK0lY?=
 =?utf-8?B?cUN5dFp5c0hMRVJHT3NrUS9USzZubC9pZ1R6MG95WHR4eHA5VTNOVXEycldX?=
 =?utf-8?B?N0IzTFVWS1hqU1hUenhRYm0rZ1NPQk1lNjlTZWZJMzNBUWcwMDBRdz09?=
X-Exchange-RoutingPolicyChecked: 
	Smwl8/2ezrJ05J8lYO3sPw/8ESTAsFfduKgoQ5ZUTZnCInbynp/EIIg35MXowhXSdAc9snvCjpuLhStHelcLqpIPa6KtiN8JINrNnCmwCpg818K2aRPLRZpaGtcFKGia9N10w0vADnKPcMnZ5IwuEWilJaELtmxN4KlJf1fIPW/FJoox4SgzVg36gTQtOvmkXZ1cm97iY5faOQgRN4uABf7ji5zibb9GO9bH35PRXdtZ6u0cC6zluRqaaYRaXPDNE7nvZnNEvYn0CV9uf0fjO3KOTXXQd06nPqBiUadML2EjNGJJn9OGrP2X23j5ZvEXyylB4zUrbrwR09frV0lI+Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb03a9c-2c6b-4b7d-543b-08decc35876e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:59:01.2013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MO17/pDNVc1nHMnydPUYgEzoRKNA4K3OkyR4GAgwuvU5NpFeZkEmXTuL27pdkgdVLpyU5pfqWOHxN+z1gDlaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7254
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA1MyBTYWx0ZWRfXyli0L7GY9/qS
 6FY7RApkvVH57e0/lgczWJJQFHDKUHE0x0YqUAa+bQvsf5HCc6m/oMc/COaA1WRr/v7QLdN3yeS
 k9HdWsEXpCpbl9vSaFsMOEecK3VlcdeDD13zNHek6Uqh4Ve0k9Cq
X-Proofpoint-GUID: mjBHMS5OryFpEQC_ru_W4Ao7LQqbg5OK
X-Proofpoint-ORIG-GUID: mjBHMS5OryFpEQC_ru_W4Ao7LQqbg5OK
X-Authority-Analysis: v=2.4 cv=ObGoyBTY c=1 sm=1 tr=0 ts=6a3237a8 cx=c_pps
 a=as7enBq54CXVX8P5rkIU3g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=V8ZE4KDTjIXCNoV6e6YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA1MyBTYWx0ZWRfXwCT/jbnAXV7l
 0KwNjZXRgHdPeSO8O07ovvwgZaQ0slN7zcUUPoBQ4gHCohJuMqT7MlNhEixVP6Pg2tTEpQtXnvC
 Yi5jb8zocZroEwl+ExhO0VeARbszEHpEEUzAvn3kyP//Ze5+nzV0vS09UBEgK1g5o8Ff0140+8P
 dcFhH6mGiI7va4zQ/DOVlJrmNuWzqFEqYuV5/mQ2HE6iHOt6yJSgzZ4l90Figg5z7dhrLebx12t
 42H+zdDCcZ6GuPKt17r384kdU8/+WKqMkpnXuiUiLifkNNAnvft+2ghTsHjRu44bKF/Umo6VRQb
 CqxDuwHP0kxaSHAB5Aap3iMVLqAKw7gVjwTqp256gHOIrJglQgKfWCh05TgMEXhCz+UGO3MZxGa
 tGUfj1ew3AcbvowAxsLgDx9zuUeMt98vIt/1qkeQ4zSwFnLe2Z61J+7IqPWwe6WfFBycIishfl8
 B6bu+H+lMWxJNlfewQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170053
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65H50Zck891991
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Jun 2026 05:59:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9764

Hi Antonin,

Thanks for you review.
I'll send out V3 according to your suggestions.
For answers to your questions, see comments inline.

On 6/16/26 22:47, Antonin Godard via lists.yoctoproject.org wrote:
> Hi,
>
> On Tue Jun 16, 2026 at 7:20 AM CEST, Chen Qi via lists.yoctoproject.org=
 wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Document patch acceptance policies and stable point release upgrades,
>> including criteria for qualifying upstreams and how stable release
>> regexes constrain version checks.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   documentation/ref-manual/release-process.rst | 114 +++++++++++++++++=
++
>>   1 file changed, 114 insertions(+)
>>
>> diff --git a/documentation/ref-manual/release-process.rst b/documentat=
ion/ref-manual/release-process.rst
>> index a55187c14..fa712869a 100644
>> --- a/documentation/ref-manual/release-process.rst
>> +++ b/documentation/ref-manual/release-process.rst
>> @@ -127,6 +127,120 @@ stable release.
>>      exception to this policy occurs when there is a strong reason suc=
h as
>>      the fix happens to also be the preferred upstream approach.
>>  =20
>> +.. _ref-stable-lts-patch-acceptance-policies:
>> +
>> +Stable/LTS Patch Acceptance Policies
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +All changes must have already been accepted into the current master r=
elease
>> +and any other release still within its stable support window.
>> +
>> +**Acceptable:**
>> +
>> +-  Security and CVE fixes
>> +-  Fixes for bugs
>> +-  Version updates which follow an upstream stable series or LTS that=
 aligns with
>> +   the original release (based on compatibility). See
>> +   :ref:`ref-manual/release-process:stable point release upgrades` fo=
r details.
>> +
>> +.. note::
>> +
>> +   Once :term:`UPSTREAM_STABLE_RELEASE_REGEX` has been accepted for a=
 recipe,
>> +   version upgrades matching the accepted pattern are considered acce=
ptable
>> +   by default (with the usual ability to reject if upstream fails to =
follow
>> +   their own stable guidelines).
>> +
>> +**Potentially acceptable:**
>> +
>> +-  Fixes so the codebase works with newly released distros
> I'm not sure I understand this. Could you expand this with an example?
I think a typical example is uninative-tarball updates. I'll add this=20
example.
>
>> +
>> +**Unacceptable:**
>> +
>> +-  General version upgrades
>> +-  New features
>> +-  ABI/API breakage
>> +-  Metadata improvements and refactoring, unless this is a dependency=
 of a
>> +   required fix
>> +
> Should we also mention that some backports / patches can be exceptions =
to these
> rules if it is approved by the TSC?
Got it. I'll add a note here that exceptions must be approved by the TSC.
>
>> +.. _ref-stable-point-release-upgrades:
>> +
>> +Stable Point Release Upgrades
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> +
>> +Some upstream projects maintain stable branches that only collect bug=
 fixes
>> +and security patches =E2=80=94 similar to the Yocto Project's own sta=
ble release
> s/=E2=80=94/---/
>
> Did you use an LLM to work on these patches? If so, please mention it w=
ith the
> AI-Generated patch trailer as per our policy:
> https://docs.yoctoproject.org/contributor-guide/submit-changes.html#acc=
eptance-of-ai-generated-code
Yes. Thanks for the info.
>
>> +policy. For recipes tracking such upstreams, it is possible to perfor=
m
>> +*stable point release upgrades* (e.g. upgrading from 1.0.2 to 1.0.3) =
rather
>> +than only accepting backported patches. This is the mechanism behind =
the
>> +"acceptable: version updates which follow an upstream stable series" =
policy above.
>> +
>> +Criteria for Qualifying Upstreams
>> +---------------------------------
>> +
>> +Setting :term:`UPSTREAM_STABLE_RELEASE_REGEX` for a recipe means that=
 certain
>> +version upgrades can be confidently treated as stable point upgrades =
under
>> +OpenEmbedded's criteria. The Automated Upgrade Helper (AUH) will then
> Link to AUH maybe:
>
> s/The Automated Upgrade Helper (AUH)/The :ref:`Automated Upgrade Helper=
 (AUH) <dev-manual/upgrading-recipes.:Using the Auto Upgrade Helper (AUH)=
>`/

I read the README file=20
(https://git.yoctoproject.org/yocto-docs/tree/documentation/README?id=3D7=
68cbc958#n31)=20
before I started modifying things.

I thought "self-contained" means no reference to other manuals. But I=20
just grepped ref-manual and it does reference other manuals.

I'll modify this in V3.

>
>> +automatically send patches to upgrade recipes with this variable set =
during
>> +stable releases.
>> +
>> +.. note::
>> +
>> +   Patches to upgrade recipes without this variable may still be subm=
itted
>> +   for stable branches, but the barrier for acceptance is high. The c=
ommit
>> +   message needs to justify that the version upgrade follows our stab=
le
>> +   branch policy or that there is an exceptional reason for taking th=
e
>> +   upgrade.
>> +
>> +A recipe may have :term:`UPSTREAM_STABLE_RELEASE_REGEX` set based on =
the
>> +following criteria:
>> +
>> +1. **Upstream stable branches exist** --- the upstream project mainta=
ins
>> +   branches named with a stable version component, and there is evide=
nce
>> +   that these branches only collect bug-fix and security-fix changes
>> +   (no new features or ABI/API breakage). For example, util-linux ver=
sion
>> +   ``2.41.3`` has three parts in its version and upstream has branche=
s like
>> +   ``stable/v2.41`` with two parts. This demonstrates that bumps in t=
he
>> +   third part (e.g. ``2.41.3`` to ``2.41.4``) are stable point releas=
es.
>> +   Similarly, systemd maintains ``stable/v259-stable``.
>> +
>> +2. **Upstream maintainer confirmation** --- the upstream project's ma=
intainer
>> +   explicitly confirms that a bump in a certain part of the version i=
s
>> +   bug-fix only.
>> +
>> +3. **Clear historical or common-sense evidence** --- the project's ch=
ange
>> +   history clearly shows that a certain class of version bump is bug-=
fix
>> +   only, or it is widely understood convention. For example, openssh'=
s
>> +   ``p`` suffix increments (``10.2p1`` to ``10.2p2``) and kmod's patc=
h-level
>> +   bumps are historically bug-fix only releases.
>> +
>> +.. note::
>> +
>> +   Patches to set :term:`UPSTREAM_STABLE_RELEASE_REGEX` are sent agai=
nst the
>> +   master branch first and follow the normal review process. Once acc=
epted on
>> +   master they may be backported to stable release branches. Exceptio=
ns may be
>> +   made when necessary, e.g. setting :term:`UPSTREAM_STABLE_RELEASE_R=
EGEX` on
>> +   a stable branch for a recipe which has since been removed on maste=
r.
>> +
>> +How Stable Release Regexes Work
>> +-------------------------------
>> +
>> +The stable point upgrade mechanism uses a *filter regex* to constrain=
 the
>> +upstream version check so that only versions within the same stable s=
eries
>> +are considered. When a recipe sets :term:`UPSTREAM_STABLE_RELEASE_REG=
EX`, the
>> +version-checking infrastructure in BitBake's fetchers (git, wget, cra=
te)
>> +applies that regex to filter discovered upstream versions. Only versi=
ons
>> +matching the regex are considered as upgrade candidates.
>> +
>> +For example, if a recipe is currently at version ``1.4.2`` and the re=
gex is
>> +``^1\.4(\.\d+)*$``, then version ``1.4.7`` would be a valid upgrade c=
andidate
>> +but ``1.5.0`` would not.
>> +
>> +For recipes whose version uses a dot-separated scheme, the
>> +:ref:`ref-classes-upstream-stable-release-point` class can automatica=
lly
>> +generate this regex. For other versioning schemes, set
>> +:term:`UPSTREAM_STABLE_RELEASE_REGEX` directly in the recipe.
>> +
>> +
> Extra newline not needed here.

Thanks for reminding.

Regards,
Qi

>
>>   .. _ref-long-term-support-releases:
>>  =20
>>   Long Term Support Releases
>
> Antonin
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9748): https://lists.yoctoproject.org/g/docs/messag=
e/9748
> Mute This Topic: https://lists.yoctoproject.org/mt/119829155/3618072
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [Qi.Chen@windr=
iver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


