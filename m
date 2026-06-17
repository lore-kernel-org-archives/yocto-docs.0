Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368C0CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:41:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9498.1781678491741398696
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 23:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=R0VXS0Ex;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0628fa2e08=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H4wdpC887882;
	Wed, 17 Jun 2026 06:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=xFF1pQ4HC
	3ScOugkZMtqFwoH5ueFQpt40xvDvmUdPP0=; b=R0VXS0ExJPF7wNptXg/S+Aeyp
	fxQ3CcnBgK4+z4wRRcoPAr9cABevW3vmHlc9rFEBL2OES6r82LUkc8zZ//JdCmNI
	7paYxDX39yejmIthU5LmY4bXk4yN9TijAo/xVPpvFcpWWzdUMUFvONqPEY+H167d
	c8hyiPn0kcoV3eofpYOryzOnUFBkVQ0jOVCMMHxn0G779CeTXJuZRQQSF+mxrdRQ
	anqtujGUhvdEmyILGrU8UI66XSWKEBafl6GCuwZw5bur31sOAKjJROU5wRvyfPNL
	Et6Ha+UJMHPJuHVzSQI2jtSHmpH65FdRUqxglzIqFfIya9kUUv8Cus39FnZ3Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011011.outbound.protection.outlook.com [52.101.52.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4euefc0jn5-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 06:41:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIL8C9QV5Rtg0RHMAcaCYcUtF+J1GEYu8J39h8dwy2avahJ13svez+ZMr4euCbF4FwYoe6DUKCEkxJyxFtBNMvcyAzuy4HRGdwrvVRItl/flMQoq47CwoIczHdvbWbEFsfgS7iu+4vMfm3ag4dBbwmaTNxJwDXq0LidGYTRjyGLNbUinjUzvZjCQY+sJy8R+VRnuuwnZXzAx5HbRQCCDLCf4YyhiaENKHPQJ5Y00Icu/TAPmBExG5YVDwYh0MlMh6wpcKJp0SUx5n3GGMghC2A6zdl4d6DPIm2iLuPpf6YfJ35yP+1dUNw9wDozH6Bwlg8VRRW1kSmyACSlU1hpYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFF1pQ4HC3ScOugkZMtqFwoH5ueFQpt40xvDvmUdPP0=;
 b=TeO5qoG4i6mb6XDYTE8eRHFVzX4qPogfmMLJqylV3CAjU9R6QJaMUPhwMLiVtFgihDyWuEf3vhdG/XL0/73+ADg0ZQ/G9VmSOGF9oKoIFYZ/1SxfWkfQz7OLxeON7bfOqwTpGsLUs1D1y5RevSOs0fAVUrFELt311AaMcqTuKj8EpqidpcbJtdsq9QB3S5EGQcYBNmkIojIlzkf9ru4i4m/ml385p5EPaKyVu3KVKMaE8lXAaNIYUUCi6hcQWvOv1sy2JBJV1Ac92eN2Go7JuSgXgmYU2FJe/NgxqTFMjDoFwgA3a3drxnlnD+d3Tonlj8rqIheSWZLQOUkT65J4KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 06:41:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 06:41:23 +0000
From: Qi.Chen@windriver.com
To: docs@lists.yoctoproject.org
Cc: alex.kanavin@gmail.com, paul@pbarker.dev, Randy.MacLeod@windriver.com,
        antonin.godard@bootlin.com
Subject: [docs][PATCH V3 1/3] ref-manual/classes.rst: add upstream-stable-release-point class documentation
Date: Tue, 16 Jun 2026 23:41:13 -0700
Message-ID: <20260617064116.2672321-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN0PR11MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: ce077dbb-2d6d-429a-1288-08decc3b72e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	lyUsVpN8AVTY9SIkEtU/NDOB+rJFCuIBBhJSVX1LDxFpPkeJO9UFv+Nls3DKjfpImFosePUm14i/K5wbvEOTD5ayX1qocI6ga+fHJE2wTfugx2XMATmatgCqZNNPCPnS5C1xGEWFLL1yHpbpuBuEQrktKHHISr4jAWOp/LXXe3FbagAbUkczLoFE8I4eo12TdiIOqGf7oNb2ZUwKSQGARoThjbX3MFzy6NqzXrG+cIsmCqbiopJcv78WUFHXePUGHgaig++v7I6hB5nP6ItSlbkElkRwQ6Q7JkqsP96glBhumxUfl0zPK7EeCBd2NRVIclvE/JdGAg1CoHs3DtNsjFJIwJlvmZYxIa6vLNs8c/2z/mUON6iBwglAkse75AYSEooZZIzw1aqpfhoWB+7HFT+tdTjZTeTodYiC9Vgl9nj3PayOgeF4jfgVbOo2hbJfnOvMpq7by9egM6qHzwhdwkBtCjlUTojqjyG7gQHQ1vA0sEUuo0c4uLU8RCI96EMVIVAs4tCP+5eknAbhqcVOb9eaL1NqnhwNbNDlDyeioRH8WhtyATvf8fXnvbLrWDODB96ROMrP4b4aD+Gmujlqizkn+F2vu1V/lscKULGap1SjjRX2SFweYvWa6r8zcpUiuEPPFbw47T2UdYa4UuiE7KdBoBN3jt7Xh3n9pOHDFXKiVXNBw9ve+nwz49gdk+PnwrdasRxxrEDpOmRFFPYy4qqC5nmJOxzqLdTKtEtp3MocN+MR8h/4bW0HMj+G/2KT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eUEvaXBJQVdpUDRpcFRGWmVML2pmMm5lNEJndVRYcUEzNHRTdFJCVFBNNU5r?=
 =?utf-8?B?eURqVjZ5cWFndXdoNm9BSzVlWnN0OHpEZ3B3dXlMNHhmVkcxaEJLbDkzRHd0?=
 =?utf-8?B?eGUrUjN5WDRlUG0yelArTlBPQSs1dkFkRTZtUGJWaGZOc2c0SlhZbGZzeXdR?=
 =?utf-8?B?MUI3dkU2QTQ0TTRYTW5tYkpPRDM1OXZzV0xrTk1YcytpdkY0MmU5R0wwRkp2?=
 =?utf-8?B?R2lPUVVrK1NYWDdySFQrSGM4Y3ExcURtQWlyVXdPeVEzUEpOaG5DZnpDQ2gr?=
 =?utf-8?B?WmYrc0V5dFVEWEt4VkRXbVRTelRHMVhieDd5NHI4dHhwMlJTYjdGUUZVTkpD?=
 =?utf-8?B?ZmR0Mm02QjIwVk9XeVNYb3ZOTGdDNkFQcVA2TGZpNXhycURYTlA3Y2dTd3Q4?=
 =?utf-8?B?TXRDdnFwbjJCK2pTMFpwV1MxeDN1VXpDbnpMZldWTUtZaGtFSlJLVGVnQU5O?=
 =?utf-8?B?eDRqL3VLV3MwYlp6S1ZSTjlaRVZEQVlKZjB6THJKY0V0QVdvS256RHFwUmVk?=
 =?utf-8?B?WDdyNmlVdFZEZ0dPM0NBZWdSQTVNdDFoZm1Yei9oZ2NOVUxmVkNqTDZBTi9M?=
 =?utf-8?B?cU5nVmp3ZDRxOEJpcHZkdkFKSG53bXlCdzhjdVpyMkRJMWdjYWQwQzZDSVJa?=
 =?utf-8?B?ZE1SRkkvdE5OYzIxQ2ZtWGU1N0p1cjR4Wmd0M2c5azhMZzE0ZkZWNHZ1emFo?=
 =?utf-8?B?bzBUeHNkSGJ4U2Nld0VPZG5rYUdJUWhBTXRDZU9wV2Ztc2lXb3hLL1VRT1Qv?=
 =?utf-8?B?b2V1WG5GbEs2U3FKdFExRGs0eWVNdVdwYys4NEtRWXVvSHdiY3RMbERZRXpq?=
 =?utf-8?B?VGx5QlF3RUVmUVl6RGlhdzdnNG5aMkF0RFNvZGlEeC8vZzkwNFpUbXVXS0Zr?=
 =?utf-8?B?d0hheEgwbXVkQ1IrWm1oSGl0ZUpqOUpZc1FGWmlHTmtmZkF3bFBkOEdldkow?=
 =?utf-8?B?T09GYXVwc0JaRjQ5RGtmcFFXeWFFUnNzcTJBUDgyak5hUFY1WVFuMjRHL3Rx?=
 =?utf-8?B?V3RVSWJUQk9kamNaaUxMUVBpZEI1N1NvSHg4TmhicEZ3SnI3cFBMUlc0anl1?=
 =?utf-8?B?cVB1MUc3R1BhV2xjNnR1WURHZ2E2STYveHZRVERxMk5uZ0I1Z2g2c2VjWHBQ?=
 =?utf-8?B?VTA0b0Z6TWx3Yy9BWVVBQ3M0QWx6Zk1qS3dON2libUJES2FQdzdzQm04NStp?=
 =?utf-8?B?SkpmQUJoNnlZVXpuN0ZWa0xVNHA1UmF1SlJqK0hTZnFya2lBdXQ5Q1N2enk5?=
 =?utf-8?B?cmlNTUlUTmRGV01WYVlyUy9DMkkyM3B0bDNLRFVuS0hYM1hybUd5NUdqYlNG?=
 =?utf-8?B?SmtrTXpiMnQ2dzlrVWEzaGFCK0l4SjdMSzhYZ00weEJ5ZnN5TUFkZDEwNm1P?=
 =?utf-8?B?STB2a0VHc3NubENQeGhNM0x2MVFlN0VmU0VjOVVjb2lyMFpMdC96Q0Z3SWRD?=
 =?utf-8?B?ci9ob1hkblh0dlBMRWRtMlZwbmlRL0xGSFZzUXc5UW9oT1hmMUxaWUhNaDl2?=
 =?utf-8?B?L0JNa0FKNXc2aTZ0TFI3d0pzTzZHLzF1M2JWVFVEUE9kNDNvdUZHVDhHdlM0?=
 =?utf-8?B?Y2tSb1JYMHVyWGkvY1ZkZFA4eUdtM2hqdkd1RFNSWWk5blMrSk4vT3l5NnpT?=
 =?utf-8?B?ZlByZmRGTzVRMk42dHFyN0JGWXE1Slord1VmQ0dXeUVIWnl5VUV3bXcvK0Jm?=
 =?utf-8?B?VVRNTTlmL1p6RElWRm50ejJUYVpib1JDa25NUWwyYlkzY3ptVDZ0enM4UTF3?=
 =?utf-8?B?UVpvY05QMkpuLzJnNVVoeTVKKzdDdmFETENpMTU3Z25KcjFuS3FQcjhhYXRM?=
 =?utf-8?B?STBwYVpRUVFNcEFXVXlBQmVrc2ZRczltOXlaM1QzcXNXOEtYNW9iZ3c4UTZy?=
 =?utf-8?B?R0pzaDRBUk9Nanc5b0RXTHVENm91TXhpejRrVGw2RFg0TmxBcm00UGR0bUVq?=
 =?utf-8?B?TmpJWDlSdHVpQW9GV1YwVDE0WHpCeGVBL2tKeTFkSUpWZXRNNldCNmFvNmhi?=
 =?utf-8?B?ajRRS3dMSmQ2ZElHSUlvcnZhUDdiTjdWb3V0eGFsdEJ6N3RIc3VNcVZyNnRm?=
 =?utf-8?B?QXRnSzNBUnZNQWZVTGJZUjN6VUM2K0t6VVJqZEpWckZNdmhaRkVPMVVETzF6?=
 =?utf-8?B?NXV5a2ptVmxoS1p1SmdOYkc5eTJVUlRVSzN4eTlSeGwrWGZBRWEwdG1qUGdO?=
 =?utf-8?B?NittL0pLTUtRZ0Z3RmhQbDNuUXpkcER0eXdUWGR6VXFCdjhZSW85VDRZVUF3?=
 =?utf-8?B?NDZDcGNIUUtLKzhieXRyNEpjT2tQVEVnUFFxbklnbEU1M0FMQWltRUJOOC8z?=
 =?utf-8?B?aVNnTWVwc0Z6QnRSdWlJMFpHL3BTUjV6S2hFSmZBdU9YNEVhdWpKUT09?=
X-Exchange-RoutingPolicyChecked: 
	jIYZEykKmHVpQ1TzP9xRPqqRKjBQ06YvqeyETtRxnameIgZvSM4gYM82xkQ4ME7TdT/pHHj6jVLj/sw/Akk6cAes+YxToIG1GT8mqhImBstP/PCOCUXhlyo44a/zA7SiLFq8bWWR4YhYp2aPnuzEBloB0v8igM5qStdw1iFhOdIPsi9yzo/MWwcXZogNaabLuD85gqEXBD/tbzwtflRK0i5WXTp0PRoz6ZV0hJ5ZFIdV2NJMfS6IpA1fVG8sXgA+ATTBd/T0Bih/HOvfscDq3i8kYIqzx0EsqyK9CNq0SMVRV81DeTWayTe3uidAAuAxnqRavdJMXsSE5/scQJpsuw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce077dbb-2d6d-429a-1288-08decc3b72e9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:41:23.6982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvtxlYbCSktyDS91n8ULC6VC08MdvWc8VHXF7iodlqRykk8z4TctaPWWDvrBJS7IwsvYGyUsJmEofu4blcl9KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA2MCBTYWx0ZWRfX9BesfVECC5HO
 cNYjxapNJB0aIC/IErKVq98emTHh8A1OhGVOKeDOYo6sNsQ3LwThbJkiXLpDNczEQMilZ3sa/lu
 uBWA1gyUI/kTK1oKl3p0Pe4G+hlwbaQ4oUkXvxaM7LNEBvIFY4eW
X-Proofpoint-GUID: sZiR7M4zQ21kj1sVfm1oieSCMpX2afjG
X-Proofpoint-ORIG-GUID: sZiR7M4zQ21kj1sVfm1oieSCMpX2afjG
X-Authority-Analysis: v=2.4 cv=ObGoyBTY c=1 sm=1 tr=0 ts=6a324198 cx=c_pps
 a=+4AL93Ollhzyglb1kYk7Zw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=t7CeM3EgAAAA:8 a=ljOHmGDoImW_DtJpQMQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA2MCBTYWx0ZWRfXzx4H1NM4B+Ba
 gwxXoObceqFBSkJ1QLEV58lGP1a8ci5YvZ85ARMHHYX/+WVikIh2CzL5vsR/tCan5wW/YtDmDGl
 VVtmgD/Nsrz4R1H8fvr3EjGeuuWC96nm87iswZqhnIbGYLuig6mkdfjI9v/lni5AKev6pRafCJe
 1Pi9m5z5mM9XL7JSZsSrJ+wR2eb9Yz3Ng6Y+bCjYLQyKmzutxWIFYeSoP0Wo1OEXfXBvQkwmOX7
 bxEfZmMWk8ZAiHIiqIEMWDlX4d3HQcY2ApE1fZ9CypvC7dI97mQLvR6fcCcZ9iK2eTETYXpQ61A
 LxZbj/JVW3+Dxk1P6fP2xiK1O0QmlvQb2NJFP4RYS29LzPtscRm03gZ8Rw0Jrbop4U9BbP3MJ4u
 ng7hHL7Z/BS2QG0BgFQs11ExYxawoc6cH1ICzIcebkFpOCB2E4TdM1Mk9LhpFMCv03Fitdxnk+T
 kWao1dRw82ghgyMZGgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170060
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65H4wdpC887882
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Jun 2026 06:41:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9766

From: Chen Qi <Qi.Chen@windriver.com>

Document the upstream-stable-release-point bbclass which automatically
generates UPSTREAM_STABLE_RELEASE_REGEX for recipes with dot-separated
version schemes, enabling stable point release upgrades.

AI-Generated: kiro-cli

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 documentation/ref-manual/classes.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index 95e07f85a..f0d9b1d55 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3655,6 +3655,30 @@ Three variables control this class: :term:`INITSCR=
IPT_PACKAGES`,
 :term:`INITSCRIPT_NAME` and :term:`INITSCRIPT_PARAMS`. See the variable =
links
 for details.
=20
+.. _ref-classes-upstream-stable-release-point:
+
+``upstream-stable-release-point``
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The :ref:`ref-classes-upstream-stable-release-point` class automatically
+generates the :term:`UPSTREAM_STABLE_RELEASE_REGEX` variable for recipes
+whose version uses a dot-separated scheme. This enables stable point rel=
ease
+upgrades =E2=80=94 version upgrades constrained to the same stable serie=
s (e.g.
+``1.4.2`` to ``1.4.3`` but not to ``1.5.0``).
+
+The class uses the :term:`STABLE_VERSION_PARTS` variable (defaults to ``=
"2"``)
+to determine how many leading dot-separated parts of :term:`PV` constitu=
te the
+stable prefix. For example:
+
+-  With ``PV =3D "1.4.2"`` and ``STABLE_VERSION_PARTS =3D "2"`` (default=
), the
+   generated regex is ``^1\.4(\.\d+)*$``.
+-  With ``PV =3D "259.5"`` and ``STABLE_VERSION_PARTS =3D "1"`` (e.g. sy=
stemd), the
+   generated regex is ``^259(\.\d+)*$``.
+
+For recipes whose stable version part is not dot-separated (e.g. openssh=
 uses
+``10.2p1``), set :term:`UPSTREAM_STABLE_RELEASE_REGEX` directly instead =
of
+inheriting this class.
+
 .. _ref-classes-useradd:
=20
 ``useradd*``
--=20
2.54.0


